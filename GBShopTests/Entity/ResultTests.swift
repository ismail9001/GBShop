//
//  ResultTests.swift
//  GBShopTests
//
//  Created by macbook on 26.06.2021.
//

import XCTest
@testable import GBShop

class ResultTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogoutResult() throws {
        let logoutResult = LogoutResult(result: 1)
        let logoutResult2 = LogoutResult(result: 2)
        XCTAssertEqual(logoutResult.result, 1)
        XCTAssertEqual(logoutResult2.result, 2)
    }
    
    func testUserUpdateResult() throws {
        let userUpdateResult = UserUpdateResult(result: 1)
        let userUpdateResult2 = UserUpdateResult(result: 2)
        XCTAssertEqual(userUpdateResult.result, 1)
        XCTAssertEqual(userUpdateResult2.result, 2)
    }
    
    func testRegistrationResult() throws {
        let registrationResult = RegistrationResult(result: 1, userMessage: "success")
        let registrationResult2 = RegistrationResult(result: 0, userMessage: "failed")
        XCTAssertEqual(registrationResult.result, 1)
        XCTAssertEqual(registrationResult.userMessage, "success")
        XCTAssertEqual(registrationResult2.result, 0)
        XCTAssertEqual(registrationResult2.userMessage, "failed")
    }
    
    func testLoginResult() throws {
        let user = User(id: 123, login: "user", name: "name", lastname: "lastname")
        let loginResult = LoginResult(result: 1, user: user)
        let loginResult2 = LoginResult(result: 2, user: user)
        XCTAssertEqual(loginResult.result, 1)
        XCTAssertEqual(loginResult2.result, 2)
        XCTAssertEqual(loginResult.user, user)
    }
    
    func testUser() throws {
        let user = User(id: 123, login: "user", name: "name", lastname: "lastname")
        XCTAssertEqual(user.id, 123)
        XCTAssertEqual(user.lastname, "lastname")
        XCTAssertEqual(user.login, "user")
        XCTAssertEqual(user.name, "name")
    }
}
