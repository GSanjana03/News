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
        if let filePath = Bundle.newsTest.path(forResource: "NewsDataMock", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
                let model: Story.Results  = try JSONDecoder().decode(Story.Results.self, from: data)
                sut.mockNewsData(storyData: model)
            } catch {
                XCTAssert(false, error.localizedDescription)
            }
        }
    }
    
    func testFetchNewsNetworkError() {
        var errorMessage: String = "URLSessionTask failed with error: The Internet connection appears to be offline."
        sut.fetchNewsArticles { articles in
            XCTFail("fetchNews should not be called in case of network error")
        } responseFailure: { (error) in
            errorMessage = error.localizedDescription
        }
             
        // Then
        XCTAssertEqual(errorMessage, "URLSessionTask failed with error: The Internet connection appears to be offline.", "Error message should match expected message")
     }
    
    func testEmptyTitle() {
        // Given
        let emptyTitle = ""
        let isEmpty = NewsViewModel().isEmptyTitle(title: emptyTitle)
        
        // Then
        XCTAssertFalse(isEmpty, "Title should not be empty")
    }
    
    func testEmptyUrl() {
        let emptyUrl = ""
        
        let isValid = NewsViewModel().isEmptyUrl(url: emptyUrl)
        
        XCTAssertFalse(isValid, "Url should not be empty")
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


