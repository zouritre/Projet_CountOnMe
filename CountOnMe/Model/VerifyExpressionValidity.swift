//
//  VerifyExpressionValidity.swift
//  CountOnMe
//
//  Created by Bertrand Dalleau on 12/03/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation

class VerifyExpressionValidity {
    
    var elements: [String]?

    var expressionIsCorrect: Bool {
        return elements?.last != "+" && elements?.last != "-" && elements?.last != "x" && elements?.last != "/"
    }
    
    var expressionHaveEnoughElement: Bool {

        return elements?.count ?? 0 >= 3
    }
    
    var canAddOperator: Bool {
        return elements?.last != "+" && elements?.last != "-" && elements?.last != "x" && elements?.last != "/"
    }
}
