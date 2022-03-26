//
//  ComputeExpression.swift
//  CountOnMe
//
//  Created by Bertrand Dalleau on 12/03/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation

class ComputeExpression {

    var elements: [String] = []

    /// Compute the whole elements array as a valid math operation
    /// - Returns: A single item array containing the result of the operation
    func operationsToReduce() -> [String] {
        
        /// Index of a multiply or divise operator symbol
        var operatorSymbolIndex = 0
        
        // Calculate division and multiplication first
        elements.forEach{
            
            // Compute a multiply or divisie operation
            if $0 == "/" || $0 == "x"{
                let left = Float32(elements[operatorSymbolIndex-1])!
                let operand = elements[operatorSymbolIndex]
                let right = Float32(elements[operatorSymbolIndex+1])!
                
                let result: Float32
                
                switch operand {
                case "x": result = left * right
                case "/": result = left / right
                default: fatalError("Unknown operator !")
                }
                
                // Remove the divise or multiply operation from the array elements
                elements.removeSubrange(operatorSymbolIndex-1...operatorSymbolIndex+1)
                
                operatorSymbolIndex -= 1
                
                // Insert the result of the operation at the index of the first operand of the removed operation
                elements.insert(String(result), at: operatorSymbolIndex)
            }
            else {
                // A divise or multiplay operator symbol has not been found at this index
                operatorSymbolIndex += 1
            }
            
        }
        
        // Iterate over operations while an operand still here
        while elements.count > 1 {
            let left = Float32(elements[0])!
            let operand = elements[1]
            let right = Float32(elements[2])!

            let result: Float32
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            default: fatalError("Unknown operator !")
            }

            elements = Array(elements.dropFirst(3))
            elements.insert("\(result)", at: 0)
        }

        return elements
    }

}
