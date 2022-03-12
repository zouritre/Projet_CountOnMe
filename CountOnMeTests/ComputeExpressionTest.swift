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
        
        computeExpression = ComputeExpression(elements: ["1", "+", "10", "-", "3"])
        XCTAssertEqual(computeExpression?.operationsToReduce(), ["8"], "Unexpected expression result")
        
        computeExpression = ComputeExpression(elements: ["1"])
        XCTAssertEqual(computeExpression?.operationsToReduce(), ["1"], "Unexpected expression result")
        
    }
    
    

}
