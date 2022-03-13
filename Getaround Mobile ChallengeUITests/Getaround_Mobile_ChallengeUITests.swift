//
//  Getaround_Mobile_ChallengeUITests.swift
//  Getaround Mobile ChallengeUITests
//
//  Created by Lluis Armengol on 11/03/2022.
//

import XCTest

class Getaround_Mobile_ChallengeUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    // Test launch app: cars are loaded and displayed in the screen: check that navigation bar exists and cells of list is > 0
    func testLoadCarsFromAPI() throws {
        let navBar = app.navigationBars["Cars List"].staticTexts["Cars List"].waitForExistence(timeout: 5)
        XCTAssertTrue(navBar)
        XCTAssertTrue(app.tables.element(boundBy: 0).cells.count > 0)
    }
    
    
    // Test car detail basic: tap first element of list, navigate to details view and check that image is displayed
    func testCarDetail() throws {
        // wait until navigation bar is displayed and check for existance
        let navBar = app.navigationBars["Cars List"].staticTexts["Cars List"].waitForExistence(timeout: 5)
        XCTAssertTrue(navBar)
        // Check that the list elements count is greater than 0
        XCTAssertTrue(app.tables.element(boundBy: 0).cells.count > 0)
        // tap first element of the list
        let articlesTable = app.tables
        articlesTable.cells.element(boundBy: 0).tap()
        // Check that image of the car exists
        let carDetailView = app.scrollViews.firstMatch
        let carPicture = carDetailView.images.firstMatch
        XCTAssertTrue(carPicture.exists)
    }
    
    // Test car detail full: tap first element of list, navigate to details view and check that all elements of first car exist
    func testCarDetailFull() throws {
        // wait until navigation bar is displayed and check for existance
        let navBar = app.navigationBars["Cars List"].staticTexts["Cars List"].waitForExistence(timeout: 5)
        XCTAssertTrue(navBar)
        // Check that the list elements count is greater than 0
        XCTAssertTrue(app.tables.element(boundBy: 0).cells.count > 0)
        // tap first element of the list
        let articlesTable = app.tables
        articlesTable.cells.element(boundBy: 0).tap()
        // Check that image of the car exists
        let carDetailView = app.scrollViews.firstMatch
        let carPicture = carDetailView.images.firstMatch
        XCTAssertTrue(carPicture.exists)
        // Check car brand and model
        let carBrandModel = carDetailView.staticTexts["Citroen C3"]
        XCTAssertTrue(carBrandModel.exists)
        // Check car price per day
        let carPrice = carDetailView.staticTexts["17 €/j"]
        XCTAssertTrue(carPrice.exists)
        // Check car rating count
        let carRating = carDetailView.staticTexts["(259)"]
        XCTAssertTrue(carRating.exists)
        // Check car rating stars
        let carRatingStars0 = carDetailView.images.matching(identifier: "Favorite").element(boundBy: 0)
        let carRatingStars1 = carDetailView.images.matching(identifier: "star.leadinghalf.fill").element(boundBy: 0)
        XCTAssertTrue(carRatingStars0.exists)
        XCTAssertTrue(carRatingStars1.exists)
        // Check owner picture --> UPDATE
        let carOwnerPicture = carDetailView.images.count
        XCTAssertTrue(carOwnerPicture>1)
        // Check owner name
        let carOwnerName = carDetailView.staticTexts["Elmira Sorrell"]
        XCTAssertTrue(carOwnerName.exists)
        // Check owner rating stars
        let ownerRatingStars0 = carDetailView.images.matching(identifier: "Favorite").element(boundBy: 4)
        let ownerRatingStars1 = carDetailView.images.matching(identifier: "star.leadinghalf.fill").element(boundBy: 1)
        XCTAssertTrue(ownerRatingStars0.exists)
        XCTAssertTrue(ownerRatingStars1.exists)
    }

}
