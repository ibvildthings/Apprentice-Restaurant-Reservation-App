//
//  ApprenticeTests.swift
//  ApprenticeTests
//
//  Created by Pritesh Desai on 4/8/18.
//  Copyright © 2018 Little Maxima LLC. All rights reserved.
//

import XCTest
@testable import Apprentice

class ApprenticeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGuestObjectIsValid() {
        //test to see if valid Guest object is created
        let guest = Guest(name: "John Smith", number: "8528393", avatar: "randomImage.jpg")
        XCTAssertNotNil(guest)
    }
    
    func testGuestObjectIsInvalid() {
        //test to see if valid Guest object is created
        var guest = Guest(name: nil, number: "8528393", avatar: "randomImage.jpg")
        XCTAssertNil(guest)
    }
    
}
