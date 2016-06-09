//
//  iOSbasicUIAppTests.swift
//  iOSbasicUIAppTests
//
//  Created by Stefan Rudvin on 07/06/16.
//  Copyright © 2016 Stefan Rudvin. All rights reserved.
//

import XCTest
@testable import iOSbasicUIApp

class iOSbasicUIAppTests: XCTestCase {
    
    // MARK: BasicappUI tests
    
    // Tests to confirm that the meal initializer returns when no name or a negative rating is provided.
    
    //
    
    func testMealInitlialization() {
        // Success case
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // Failure cases
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
    }
    
    
    
    
}
