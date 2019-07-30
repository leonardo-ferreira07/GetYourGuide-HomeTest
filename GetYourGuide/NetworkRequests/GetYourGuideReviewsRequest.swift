//
//  GetYourGuideRequest.swift
//  GetYourGuide
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import Foundation

struct GetYourGuideReviewsRequest: RequestProtocol {
    
    private var page: Int = 0
    
    init(page: Int = 0) {
        self.page = page
    }
    
    var urlString: String {
        return URLConstants.reviewsURL
    }
    
    var method: URLMethod {
        return .GET
    }
    
    var queryItems: [URLQueryItem]? {
        return [URLQueryItem(name: "count", value: "15"),
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "sortBy", value: "date_of_review"),
                URLQueryItem(name: "direction", value: "DESC")]
    }
    
    var headers: [String : String]?
}
