//
//  ComputeExpressionTest.swift
//  CountOnMeTests
//
//  Created by Bertrand Dalleau on 12/03/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class ComputeExpressionTest: XCTestCase {

    var computeExpression: ComputeExpression?

    /// Test operationsToReduce method
    func testGivenExpressionIsValidWhenEqualIsPressedThenShouldDisplayCorrectResult() {
        
        computeExpression = ComputeExpression(elements: ["1", "+", "10"])
        XCTAssertEqual(computeExpression?.operationsToReduce(), ["11.0"])

        computeExpression = ComputeExpression(elements: ["1", "-", "10"])
        XCTAssertEqual(computeExpression?.operationsToReduce(), ["-9.0"])

        computeExpression = ComputeExpression(elements: ["2", "x", "10"])
        XCTAssertEqual(computeExpression?.operationsToReduce(), ["20.0"])

        computeExpression = ComputeExpression(elements: ["10", "/", "2"])
        XCTAssertEqual(computeExpression?.operationsToReduce(), ["5.0"])

        computeExpression = ComputeExpression(elements: ["5", "+", "10", "-", "3", "x", "2", "/", "2"])
        XCTAssertEqual(computeExpression?.operationsToReduce(), ["12.0"])
        
    }

}
