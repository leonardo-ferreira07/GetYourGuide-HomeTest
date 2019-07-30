//
//  RequestProtocol.swift
//  GetYourGuide
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import Foundation

public enum URLMethod: String {
    case GET
    case POST
    case DELETE
    case PUT
    case PATCH
}

public protocol RequestProtocol {
    var urlString: String { get }
    var body: Data? { get }
    var timeout: TimeInterval { get }
    var method: URLMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
    var urlRequest: URLRequest? { get }
    
    //func isSuccessResponse<T: Decodable>(_ response: T?) -> Bool
    func isSuccessResponse(_ response: Data?) -> Bool
}

extension RequestProtocol {
    
    public var body: Data? {
        return nil
    }
    
    public var timeout: TimeInterval {
        return 10
    }
    
    public var method: URLMethod {
        return .GET
    }
    
    public var urlRequest: URLRequest? {
        guard let url = urlString.url(withQueryItems: queryItems) else {
            return nil
        }
        
        return URLRequest.request(with: url,
                                  method: method,
                                  bodyData: body,
                                  headers: headers,
                                  timeoutAfter: timeout)
    }
    
    public func isSuccessResponse(_ response: Data?) -> Bool {
        return response != nil
    }
}
