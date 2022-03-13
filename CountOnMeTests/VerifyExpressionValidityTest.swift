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

    /// Test expressionIsCorrect computed variable
    func testGivenOperatorSymbolIsLastItemWhenEqualButtonIsPressedThenExpressionIsNotValid() {

        guard let verifyExpressionValidity = verifyExpressionValidity else {
            XCTAssertTrue(Bool(false))
            return
        }

        verifyExpressionValidity.elements = ["+"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)

        verifyExpressionValidity.elements = ["-"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)

        verifyExpressionValidity.elements = ["x"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)

        verifyExpressionValidity.elements = ["/"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)

        verifyExpressionValidity.elements = ["10"]
        XCTAssertTrue(verifyExpressionValidity.expressionIsCorrect)

        verifyExpressionValidity.elements = ["-100", "/", "2"]
        XCTAssertTrue(verifyExpressionValidity.expressionIsCorrect)
    }

    /// Test expressionHaveEnoughElement computed variable
    func testGivenExpressionHaveThreeElementsOrMoreWhenEqualIsPressedThenExpressionIsCorrect() {

        guard let verifyExpressionValidity = verifyExpressionValidity else {
            XCTAssertTrue(Bool(false))
            return
        }

        verifyExpressionValidity.elements = ["10"]
        XCTAssertFalse(verifyExpressionValidity.expressionHaveEnoughElement)

        verifyExpressionValidity.elements = ["15", "+", "5"]
        XCTAssertTrue(verifyExpressionValidity.expressionHaveEnoughElement)

        verifyExpressionValidity.elements = ["15", "-", "5"]
        XCTAssertTrue(verifyExpressionValidity.expressionHaveEnoughElement)

        verifyExpressionValidity.elements = ["10", "x", "10"]
        XCTAssertTrue(verifyExpressionValidity.expressionHaveEnoughElement)

        verifyExpressionValidity.elements = ["100", "/", "10"]
        XCTAssertTrue(verifyExpressionValidity.expressionHaveEnoughElement)

        verifyExpressionValidity.elements = ["10", "-", "5", "+", "15", "x", "2", "/", "4"]
        XCTAssertTrue(verifyExpressionValidity.expressionHaveEnoughElement)
    }

    /// Test canAddOperator computed variable
    func testGivenOperatorSymbolIsLastItemWhenEqualButtonIsPressedThenCannotAddOperator() {

        guard let verifyExpressionValidity = verifyExpressionValidity else {
            XCTAssertTrue(Bool(false))
            return
        }

        verifyExpressionValidity.elements = ["+"]
        XCTAssertFalse(verifyExpressionValidity.canAddOperator)

        verifyExpressionValidity.elements = ["-"]
        XCTAssertFalse(verifyExpressionValidity.canAddOperator)

        verifyExpressionValidity.elements = ["x"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)

        verifyExpressionValidity.elements = ["/"]
        XCTAssertFalse(verifyExpressionValidity.expressionIsCorrect)

        verifyExpressionValidity.elements = ["10"]
        XCTAssertTrue(verifyExpressionValidity.canAddOperator)

        verifyExpressionValidity.elements = ["-97"]
        XCTAssertTrue(verifyExpressionValidity.canAddOperator)
    }

}
