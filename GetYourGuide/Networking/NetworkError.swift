//
//  NetworkingError.swift
//  GetYourGuide
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import Foundation

enum NetworkError: Error, Equatable {
    case invalidUrl
    case timeOut(String?)
    case unknown(String?)
    case cancelled(String?)
    case generic(String?)
    case noConnection(String?)
    case unauthorized
    case invalidData
    case uploadFailed(String?)
    case cacheRule(String?)
    case parse(String?)
    
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidUrl, .invalidUrl): return true
        case (.timeOut, .timeOut): return true
        case (.unknown, .unknown): return true
        case (.cancelled, .cancelled): return true
        case (.generic, .generic): return true
        case (.noConnection, .noConnection): return true
        case (.unauthorized, .unauthorized): return true
        case (.invalidData, .invalidData): return true
        case (.uploadFailed, .uploadFailed): return true
        case (.cacheRule, .cacheRule): return true
        case (.parse, .parse): return true
        default: return false
        }
    }
}
