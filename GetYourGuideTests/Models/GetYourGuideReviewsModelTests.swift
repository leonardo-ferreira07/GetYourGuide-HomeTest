//
//  GetYourGuideReviewsModelTests.swift
//  GetYourGuideTests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 30/07/19.
//  Copyright © 2019 Leonardo Ferreira. All rights reserved.
//

import XCTest

class GetYourGuideReviewsModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModelAgainstDummyData() {
        guard let data = MockJSONLoader.loadJSONData(file: "reviewsPopulated", usingClass: self) else {
            XCTFail("a json FILE is needed in order to proceed with the test")
            return
        }
        
        let decodedData = try? JSONDecoder().decode(GetYourGuideReviewsModel.self, from: data)
        XCTAssertEqual(decodedData?.reviews[2].author, "Franz-Josef – Germany")
        XCTAssertEqual(decodedData?.reviews.count, 15)
        
    }
    
    func testModelAgainstDummyDataWithNullData() {
        guard let data = MockJSONLoader.loadJSONData(file: "reviewsEmpty", usingClass: self) else {
            XCTFail("a json FILE is needed in order to proceed with the test")
            return
        }
        
        let decodedData = try? JSONDecoder().decode(GetYourGuideReviewsModel.self, from: data)
        XCTAssertEqual(decodedData?.reviews[0].author, nil)
        XCTAssertEqual(decodedData?.reviews.count, 1)
        
    }

}
