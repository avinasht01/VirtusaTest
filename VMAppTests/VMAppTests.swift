//
//  VMAppTests.swift
//  VMAppTests
//
//  Created by Cerence Pace Mac on 12/04/22.
//

import XCTest
@testable import VMApp

class VMAppTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCreatingRoomsModelInstance() {
        let room = Rooms(createdAt: "12-04-22", id: "1", isOccupied: false, maxOccupancy: 100)
        XCTAssertNotNil(room, "The room instance is not nil")
        XCTAssertTrue(room.hasValidID())
    }
    
    func testCreatingPeopleModelInstance() {
        let people = People(createdAt: "12-04-22", firstName: "John", lastName: "Snow", email: "js@gmail.com", avatar: "", jobTitle: "Senior Engineer", favouriteColor: "Blue", id: "10", peopleData: nil)
        XCTAssertNotNil(people, "The people instance is not nil")
        XCTAssertTrue(people.hasValidEmailId())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
