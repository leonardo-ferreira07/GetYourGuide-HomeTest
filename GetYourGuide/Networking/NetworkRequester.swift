//
//  NetworkingRequester.swift
//  GetYourGuide
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import Foundation

typealias DataResponse = (Data?, NetworkError?) -> Void

class NetworkingRequester: NSObject {
    
    /// Fetch data from URL with NSUrlSession
    ///
    /// - Parameters:
    ///   - request: Parameters for request
    ///   - completion: Returns fetched NSData in a block
    /// - Returns: URLSessionDataTask
    func performRequest(_ request: RequestProtocol,
                        completion: @escaping DataResponse) {
        guard let urlRequest = request.urlRequest else {
            return
        }
        
        performRequest(urlRequest, completion: completion)
        
    }
    
    /// Fetch data from URL with NSUrlSession
    ///
    /// - Parameters:
    ///   - urlRequest: Url Request to fetch data form
    ///   - completion: Returns fetched NSData in a block
    /// - Returns: URLSessionDataTask
    private func performRequest(_ urlRequest: URLRequest,
                        completion: @escaping DataResponse) {
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                print("There was an error \(error.localizedDescription)")
                
                let urlError = error as NSError
                if urlError.code == NSURLErrorTimedOut {
                    completion(nil, NetworkError.timeOut(error.localizedDescription))
                } else if urlError.code == NSURLErrorNotConnectedToInternet {
                    completion(nil, NetworkError.noConnection(error.localizedDescription))
                } else if urlError.code == URLError.cancelled.rawValue {
                    completion(nil, NetworkError.cancelled(error.localizedDescription))
                } else {
                    completion(nil, NetworkError.unknown(error.localizedDescription))
                }
            }else{
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 401  {
                    completion(nil, NetworkError.unauthorized)
                } else {
                    completion(data, nil)
                }
            }
        }
        dataTask.resume()
    }
}
