//
//  TheNewsTests.swift
//  TheNewsTests
//
//  Created by Sanjana Babhulgaonkar on 03/02/24.
//

import XCTest
@testable import TheNews

final class TheNewsTests: XCTestCase {

    var sut: NewsViewModel!

    override func setUp() {
         super.setUp()
         sut = NewsViewModel()
     }
    
     override func tearDown() {
         sut = nil
         super.tearDown()
    }
    
    func testFetchNewsArticles() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch news articles")
        sut.mockNewsData { articles in
            // Then
            XCTAssertNotNil(articles, "News articles should not be nil")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
