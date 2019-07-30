//
//  GetYourGuideReviewsModel.swift
//  GetYourGuide
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import Foundation

struct GetYourGuideReviewsModel: Decodable {
    
    let reviews: [GetYourGuideReviewModel]
    
    private enum CodingKeys: String, CodingKey {
        case reviews = "data"
    }
}

struct GetYourGuideReviewModel: Decodable {
    
    let reviewId: Int?
    let rating: String?
    let title: String?
    let message: String?
    let author: String?
    let foreignLanguage: Bool?
    let date: String?
    let languageCode: String?
    let travelerType: String?
    let reviewerName: String?
    let reviewerCountry: String?
    let reviewerProfilePhoto: String?
    
}

extension GetYourGuideReviewModel {
    private enum CodingKeys: String, CodingKey {
        case reviewId = "review_id"
        case rating
        case title
        case message
        case author
        case foreignLanguage
        case date
        case languageCode
        case travelerType = "traveler_type"
        case reviewerName
        case reviewerCountry
        case reviewerProfilePhoto
    }
}
