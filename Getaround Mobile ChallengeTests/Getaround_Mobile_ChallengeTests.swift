//
//  Getaround_Mobile_ChallengeTests.swift
//  Getaround Mobile ChallengeTests
//
//  Created by Lluis Armengol on 11/03/2022.
//

import XCTest
@testable import Getaround_Mobile_Challenge

class Getaround_Mobile_ChallengeTests: XCTestCase {

    let carsViewModel = CarsViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    // Test function for the GET cars method: get cars from API and store them into the published array of cars
    // ASYNCRONOYS function --> use of methodology "expectations" is used
    func testGetCars() throws {
        let expectation = expectation(description: "\(#function)")
        carsViewModel.getCars(completion: {success, error in
            XCTAssertEqual(success, true)
            XCTAssertEqual(error, "")
            XCTAssertFalse(self.carsViewModel.cars.isEmpty)                         // check that [car] is not empty
            XCTAssertFalse(self.carsViewModel.cars.first?.brand == nil)             // check that car property "brand" exists
            XCTAssertFalse(self.carsViewModel.cars.first?.rating.average == nil)    // check that rating property "average" exists
            XCTAssertFalse(self.carsViewModel.cars.first?.owner.name == nil)        // check that owner property "name" exists
            expectation.fulfill()
        })
        waitForExpectations(timeout: 3)
    }

    
    // Test function for failure of the GET cars method: when url is not correct
    // ASYNCRONOYS function --> use of methodology "expectations" is used
    func testGetCarsFail() throws {
        let failURL = URL(string: "https://fail_URL.json")
        let expectation = expectation(description: "\(#function)")
        carsViewModel.getCars(failURL, completion: {success, error in
            XCTAssertEqual(success, false)
            XCTAssertFalse(error == "")
            XCTAssertTrue(self.carsViewModel.cars.isEmpty)                          // check that [car] is empty
            XCTAssertTrue(self.carsViewModel.cars.first?.brand == nil)              // check that car property "brand" does not exist
            XCTAssertTrue(self.carsViewModel.cars.first?.rating.average == nil)     // check that rating property "average" does not exist
            XCTAssertTrue(self.carsViewModel.cars.first?.owner.name == nil)         // check that owner property "name" does not exist
            expectation.fulfill()
        })
        waitForExpectations(timeout: 3)
    }

}
