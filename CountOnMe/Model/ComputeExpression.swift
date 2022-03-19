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
        
        var nextAvailableIndex = 0
        
        // Calculate division and multiplication, remove the operation from elements array and insert the result instead at the index of the first operand
        elements.forEach{
            
            if $0 == "/" || $0 == "x"{
                let left = Float32(elements[nextAvailableIndex-1])!
                let operand = elements[nextAvailableIndex]
                let right = Float32(elements[nextAvailableIndex+1])!
                
                let result: Float32
                
                switch operand {
                case "x": result = left * right
                case "/": result = left / right
                default: fatalError("Unknown operator !")
                }
                
                elements.removeSubrange(nextAvailableIndex-1...nextAvailableIndex+1)
                
                nextAvailableIndex -= 1
                
                elements.insert(String(result), at: nextAvailableIndex)
            }
            else {
                nextAvailableIndex += 1
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
