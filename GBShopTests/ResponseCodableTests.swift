//
//  ResponseCodableTests.swift
//  GBShopTests
//
//  Created by macbook on 26.06.2021.
//

import XCTest
@testable import GBShop

class ResponseCodableTests: XCTestCase {
    
    var requestFactory: RequestFactory!
    var expectation: XCTestExpectation!
        
    override func setUp() {
        super.setUp()
        requestFactory = RequestFactory()
        expectation = XCTestExpectation(description: Config.url.absoluteString)
    }
    
    override func tearDown() {
        super.tearDown()
        requestFactory = nil
        expectation = nil
    }
    
    func testShouldRegister() throws {
        
        let registration = requestFactory.makeRegistrationRequestFactory()
        
        registration.register(userId: 123, username: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(_): break
            case .failure(let error):
                XCTFail(String(describing: error))
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testShouldUpdate() throws {
        
        let updateUser = requestFactory.makeUserUpdateRequestFactory()
        
        updateUser.updateUser(userId: 123, username: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(_): break
            case .failure(let error):
                XCTFail(String(describing: error))
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testShouldAuth() throws {
        
        let auth = requestFactory.makeAuthRequestFatory()
        
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(_): break
            case .failure(let error):
                XCTFail(String(describing: error))
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testShouldLogout() throws {
        
        let exit = requestFactory.makeLogoutRequestFactory()
        
        exit.logout(userId: 123) { response in
            switch response.result {
            case .success(_): break
            case .failure(let error):
                XCTFail(String(describing: error))
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}