//
//  GetYourGuideTests.swift
//  GetYourGuideTests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import XCTest
@testable import GetYourGuide

class GetYourGuideURLTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMainReviewsURLIsCorrect() {
        XCTAssertEqual(URLConstants.reviewsURL, "https://www.getyourguide.com/berlin-l17/tempelhof-2-hour-airport-history-tour-berlin-airlift-more-t23776/reviews.json")
    }
    
    func testMainReviewsURLIsCorrectWithQueries() {
        XCTAssertEqual(GetYourGuideReviewsRequest().urlRequest?.url?.absoluteString, "https://www.getyourguide.com/berlin-l17/tempelhof-2-hour-airport-history-tour-berlin-airlift-more-t23776/reviews.json?count=15&page=0&sortBy=date_of_review&direction=DESC")
    }

}
