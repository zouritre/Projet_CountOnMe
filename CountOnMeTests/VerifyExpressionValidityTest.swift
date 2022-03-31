//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Bertrand Dalleau on 12/03/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class VerifyExpressionValidityTest: XCTestCase {

    var verifyExpressionValidity: VerifyExpressionValidity = VerifyExpressionValidity()

    override func setUp() {
        super.setUp()
        verifyExpressionValidity = VerifyExpressionValidity()
    }

    /// Test if given expression is a correct math operation
    func testGivenOperationHasNoResultWhenEqualButtonIsPressedThenExpressionIsNotValid() {

        verifyExpressionValidity.elements = ["+"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)

        verifyExpressionValidity.elements = ["-"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)

        // Should return false if expression has only one element or last element is an operator symbol
        verifyExpressionValidity.elements = ["x"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)

        verifyExpressionValidity.elements = ["/"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)
        
        // Should return false if expression is empty
        verifyExpressionValidity.elements = []
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)

        // Should return false if expression has only one element
        verifyExpressionValidity.elements = ["10"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)
        
        // Should return false if expression has only two elements or last element is an operator symbol
        verifyExpressionValidity.elements = ["10", "/"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)
        
        // Should return false if expression has enough element but last one is an operator symbol
        verifyExpressionValidity.elements = ["10", "/", "2", "+"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)
        
        // Should return false if operation is a division by zero
        verifyExpressionValidity.elements = ["-100", "/", "0"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)
        
        // Should return false if expression has correct format but contain division by zero
        verifyExpressionValidity.elements = ["-100", "/", "0", "+", "10", "/", "2"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)

        // Should return true if expression has at least 3 elements, is a valid math operation and is not a division by zero
        verifyExpressionValidity.elements = ["-100", "/", "2", "+", "10", "/", "2"]
        XCTAssertTrue(verifyExpressionValidity.expressionIsCorrect)
        
    }

}
