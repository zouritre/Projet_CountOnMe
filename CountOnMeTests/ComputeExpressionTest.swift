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
    
    func testGivenExpressionIsValidWhenEqualIsPressedThenShouldDisplayCorrectResult() {
        
        computeExpression = ComputeExpression(elements: ["1", "+", "10"])
        XCTAssertEqual(computeExpression?.operationsToReduce(), ["11"], "Unexpected expression result")
        
        computeExpression = ComputeExpression(elements: ["1", "-", "10"])
        XCTAssertEqual(computeExpression?.operationsToReduce(), ["-9"], "Unexpected expression result")
        
        computeExpression = ComputeExpression(elements: ["1", "x", "10"])
        XCTAssertEqual(computeExpression?.operationsToReduce(), ["10"], "Unexpected expression result")
        
        computeExpression = ComputeExpression(elements: ["10", "/", "2"])
        XCTAssertEqual(computeExpression?.operationsToReduce(), ["5"], "Unexpected expression result")
        
        computeExpression = ComputeExpression(elements: ["1", "+", "10", "-", "3", "x", "2", "/", "4"])
        XCTAssertEqual(computeExpression?.operationsToReduce(), ["4"], "Unexpected expression result")

        
        
    }
    
    

}
