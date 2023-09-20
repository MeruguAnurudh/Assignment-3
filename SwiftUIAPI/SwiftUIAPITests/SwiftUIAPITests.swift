//
//  SwiftUIAPITests.swift
//  SwiftUIAPITests
//
//  Created by Merugu Anurudh on 14/09/23.
//

import XCTest
@testable import SwiftUIAPI
final class SwiftUIAPITests: XCTestCase {
    let viewModel = LoginViewModel()
    override func setUpWithError() throws {
    }
    override func tearDownWithError() throws {
    }
    func testSuccessfulLogin() {
            let expectation = XCTestExpectation(description: "Successful login")
            viewModel.getToken(username: "atistagetest", password: "Password1") { success in
            XCTAssertTrue(success)
                XCTAssertNotNil(self.viewModel.tokenResponse)
                XCTAssertNotNil(self.viewModel.tokenResponse?.getExpiresOn())
                XCTAssertNotNil(self.viewModel.tokenResponse?.getToken())
                if let jsonData = try? JSONEncoder().encode(self.viewModel.tokenResponse),
                           let jsonDictionary = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                    //checking the key "token"
                            XCTAssertTrue(jsonDictionary.keys.contains("token"), "The 'token' key should exist in the JSON data")
                        } else {
                            XCTFail("Failed to get JSON data")
                        }
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5.0)
        }
    func testFailedLogin() {
            let expectation = XCTestExpectation(description: "Failed login")
            viewModel.getToken(username: "Anurudh", password: "king") { success in
                XCTAssertFalse(success)
                XCTAssertNil(self.viewModel.tokenResponse)
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5.0)
        }
    func testPerformanceExample() throws {
        measure {
        }
    }
}
