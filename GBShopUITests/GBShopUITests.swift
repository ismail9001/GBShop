//
//  GBShopUITests.swift
//  GBShopUITests
//
//  Created by macbook on 20.06.2021.
//

import XCTest

extension XCUIElement {
    
//    func forceTapElement() {
//        if self.isHittable {
//            self.tap()
//        } else {
//            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))
//            coordinate.tap()
//        }
//    }
    
    func scrollToElement(element: XCUIElement) {
        while !element.visible() {
            swipeUp()
        }
    }

    func visible() -> Bool {
        guard self.exists && !self.frame.isEmpty else { return false }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
    }
}

class GBShopUITests: XCTestCase {
    
    var app: XCUIApplication!
    var scrollViewsQuery: XCUIElementQuery!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation -
        // required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        
        app.launch()
        scrollViewsQuery = app.scrollViews
    }
    
    func testAuthSuccess() {
        let app = XCUIApplication()
        let elementsQuery = app.scrollViews.otherElements
        let loginTextField = elementsQuery.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText("1")
        let gbShopElement = scrollViewsQuery.otherElements.containing(.staticText, identifier: "GB SHOP").element
        gbShopElement.swipeUp()
        let passwordTextField = elementsQuery.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("1")
        elementsQuery/*@START_MENU_TOKEN@*/.buttons["enter"]/*[[".buttons[\"Login\"]",".buttons[\"enter\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.navigationBars["Каталог"].identifier == "Каталог")
    }
    
    func testAuthFail() {
        let app = XCUIApplication()
        let elementsQuery = app.scrollViews.otherElements
        let loginTextField = elementsQuery.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText("3")
        let gbShopElement = scrollViewsQuery.otherElements.containing(.staticText, identifier: "GB SHOP").element
        gbShopElement.swipeUp()
        let passwordTextField = elementsQuery.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("3")
        elementsQuery/*@START_MENU_TOKEN@*/.buttons["enter"]/*[[".buttons[\"Login\"]",".buttons[\"enter\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(app.alerts.element.label, "Ошибка")
    }
    
    func testFailEmptyFields() {
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery/*@START_MENU_TOKEN@*/.buttons["enter"]/*[[".buttons[\"Login\"]",".buttons[\"enter\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(app.alerts.element.label, "Внимание")
    }
    
    private func enterAuthData(login: String, password: String) {
        let loginTextField = scrollViewsQuery.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(login)

        let passwordTextField = scrollViewsQuery.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText(password)

        let button = scrollViewsQuery.buttons["enter"]
        button.tap()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testShowTest() throws {
                
    }
}
