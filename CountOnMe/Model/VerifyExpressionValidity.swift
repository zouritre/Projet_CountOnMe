//
//  VerifyExpressionValidity.swift
//  CountOnMe
//
//  Created by Bertrand Dalleau on 12/03/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation

class VerifyExpressionValidity {

    var elements: [String]!

    /// Return true if the last item of array elements is not an operator symbol
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }

    /// Return true if array element size is at least 3
    var expressionHaveEnoughElement: Bool {

        return elements.count >= 3
    }

    /// Return true if the last item of array elements is not an operator symbol
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
}
