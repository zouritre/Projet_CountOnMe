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


    var verifyExpressionValidity: VerifyExpressionValidity?

    override func setUp() {
        super.setUp()
        verifyExpressionValidity = VerifyExpressionValidity()
    }

    func testGivenOperatorSymbolIsLastItemWhenEqualButtonIsPressedThenExpressionIsNotValid() {
        
        guard let verifyExpressionValidity = verifyExpressionValidity else {
            XCTAssertTrue(Bool(false))
            return
        }

        verifyExpressionValidity.elements = ["+"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)
        
        verifyExpressionValidity.elements = ["-"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)
        
        verifyExpressionValidity.elements = ["10"]
        XCTAssertTrue(verifyExpressionValidity.expressionIsCorrect)
        
        verifyExpressionValidity.elements = ["-97"]
        XCTAssertTrue(verifyExpressionValidity.expressionIsCorrect)
    }
    
    func testGivenExpressionHaveThreeElementsOrMoreWhenEqualIsPressedThenExpressionIsCorrect() {
        
        guard let verifyExpressionValidity = verifyExpressionValidity else {
            XCTAssertTrue(Bool(false))
            return
        }
        
        verifyExpressionValidity.elements = ["10"]
        XCTAssertFalse(verifyExpressionValidity.expressionHaveEnoughElement)
        
        verifyExpressionValidity.elements = ["10", "-", "21"]
        XCTAssertTrue(verifyExpressionValidity.expressionHaveEnoughElement)
        
        verifyExpressionValidity.elements = ["10", "-", "21", "+", "32"]
        XCTAssertTrue(verifyExpressionValidity.expressionHaveEnoughElement)
    }
    
    func testGivenOperatorSymbolIsLastItemWhenEqualButtonIsPressedThenCannotAddOperator() {
        
        guard let verifyExpressionValidity = verifyExpressionValidity else {
            XCTAssertTrue(Bool(false))
            return
        }

        verifyExpressionValidity.elements = ["+"]
        XCTAssertFalse(verifyExpressionValidity.canAddOperator)
        
        verifyExpressionValidity.elements = ["-"]
        XCTAssertFalse(verifyExpressionValidity.canAddOperator)
        
        verifyExpressionValidity.elements = ["10"]
        XCTAssertTrue(verifyExpressionValidity.canAddOperator)
        
        verifyExpressionValidity.elements = ["-97"]
        XCTAssertTrue(verifyExpressionValidity.canAddOperator)
    }
    
    

}
