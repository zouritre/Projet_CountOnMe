//
//  ComputeExpression.swift
//  CountOnMe
//
//  Created by Bertrand Dalleau on 12/03/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation

class ComputeExpression {
    
    private var elements: [String]
    
    init(elements: [String]) {
        
        self.elements = elements
    }
    
    func operationsToReduce() -> [String] {
        
        // Iterate over operations while an operand still here
        while elements.count > 1 {
            let left = Int(elements[0])!
            let operand = elements[1]
            let right = Int(elements[2])!
            
            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "/": result = left / right
            default: fatalError("Unknown operator !")
            }
            
            elements = Array(elements.dropFirst(3))
            elements.insert("\(result)", at: 0)
        }
        
        return elements
    }
    
}
