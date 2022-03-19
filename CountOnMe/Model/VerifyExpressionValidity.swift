//
//  VerifyExpressionValidity.swift
//  CountOnMe
//
//  Created by Bertrand Dalleau on 12/03/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation

class VerifyExpressionValidity {

    var elements: [String] = []
    
    private var zeroDivision : Bool = false

    /// Return true if the last item of array elements is not an operator symbol
    var expressionIsCorrect: Bool {
        for (index, item) in elements.enumerated() {
            if item == "/" && index < elements.count-1{
                if elements[index+1] == "0" {
                    zeroDivision = true
                    break
                }
                else {
                    zeroDivision = false
                }
            }
        }
        
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/" && elements.count >= 3 && zeroDivision == false
    }

    /// Return true if array element size is at least 3
    var expressionHaveEnoughElement: Bool {

        return elements.count >= 3
    }

    /// Return true if the last item of array elements is not an operator symbol
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/" && elements.count >= 1
    }
}
