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
    case error = "GetYourGuideReviewError"
}

struct GetYourGuideReviewCell {
    var type: GetYourGuideReviewTypeCell = .review
    var review: GetYourGuideReviewModel?
    
    init(_ review: GetYourGuideReviewModel?, type: GetYourGuideReviewTypeCell = .review) {
        self.review = review
        self.type = type
    }
}

class GetYourGuideReviewsViewModel {
    
    private let requester: NetworkRequester = NetworkRequester()
    private var reviewsRequest: GetYourGuideReviewsRequest!
    private var cells: [GetYourGuideReviewCell] = []
    
    var isLoadingContent: Bool = false
    
    func getData(page: Int = 0, response: @escaping ([GetYourGuideReviewCell]) -> Void) {
        isLoadingContent = true
        response([])
        
        reviewsRequest = GetYourGuideReviewsRequest(page: page)
        requester.performRequest(reviewsRequest) { [weak self] (data: GetYourGuideReviewsModel?, error) in
            guard let self = self else { return }
            self.isLoadingContent = false
            
            if let error = error {
                print(error)
                if self.cells.isEmpty {
                    self.cells.append(GetYourGuideReviewCell(nil, type: .error))
                }
                response(self.cells)
                return
            }
            
            if page == 0 {
                self.cells = []
            }
            for review in data?.reviews ?? [] {
                self.cells.append(GetYourGuideReviewCell.init(review))
            }
            
            response(self.cells)
        }
    }
    
}
