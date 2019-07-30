//
//  GetYourGuideReviewsViewModel.swift
//  GetYourGuide
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import Foundation

enum GetYourGuideReviewTypeCell: String {
    case review = "GetYourGuideReview"
}

struct GetYourGuideReviewCell {
    var type: GetYourGuideReviewTypeCell = .review
    var review: GetYourGuideReviewModel?
    
    init(_ review: GetYourGuideReviewModel?) {
        self.review = review
    }
}

class GetYourGuideReviewsViewModel {
    
    let requester: NetworkingRequester = NetworkingRequester()
    var reviewsRequest: GetYourGuideReviewsRequest = GetYourGuideReviewsRequest()
    
    var isLoadingContent: Bool = false
    
    func getData(page: Int = 0, response: @escaping ([GetYourGuideReviewCell]) -> Void) {
        isLoadingContent = true
        response([])
        
        requester.performRequest(reviewsRequest) { [weak self] (data: GetYourGuideReviewsModel?, error) in
            self?.isLoadingContent = false
            
            if let error = error {
                print(error)
                return
            }
            
            var cells: [GetYourGuideReviewCell] = []
            for review in data?.reviews ?? [] {
                cells.append(GetYourGuideReviewCell.init(review))
            }
            
            response(cells)
        }
    }
    
}
