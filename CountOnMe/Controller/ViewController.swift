//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    /// Return an array of strings corresponding to each string elements of textView.text separated by a space
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    
    //MARK: -   Error check computed variables
    
    var verifyExpressionValidity: VerifyExpressionValidity?
    
    
    /// Return true if textView contain the equal operator symbol
    var expressionHaveResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
    }
    
    //MARK: -  View Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        verifyExpressionValidity = VerifyExpressionValidity()
    }
    
    
    //MARK: -   View actions
    
    /// Empty textView.text if an expression have previously been calculated and append to it the sender.title
    /// - Parameter sender: A UIButton corresponding to the tapped number
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if expressionHaveResult {
            textView.text = ""
        }
        
        textView.text.append(numberText)
    }
    
    
    /// Append the addition operator symbol to textView.text if possible or display an alert
    /// - Parameter sender: The UIButton of the tapped operator symbol
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        
        guard let verifyExpressionValidity = verifyExpressionValidity else {
            return
        }
        
        verifyExpressionValidity.elements = elements
        
        if verifyExpressionValidity.canAddOperator {
            textView.text.append(" + ")
        } else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    /// Append the subtraction operator symbol to textView.text if possible or display an alert
    /// - Parameter sender: The UIButton of the tapped operator symbol
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        
        guard let verifyExpressionValidity = verifyExpressionValidity else {
            return
        }
        
        verifyExpressionValidity.elements = elements
        
        if verifyExpressionValidity.canAddOperator {
            textView.text.append(" - ")
        } else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    /// Append the multiplication operator symbol to textView.text if possible or display an alert
    /// - Parameter sender: The UIButton of the tapped operator symbol
    @IBAction func tappedMultiplyButton(_ sender: UIButton) {
        
        guard let verifyExpressionValidity = verifyExpressionValidity else {
            return
        }
        
        verifyExpressionValidity.elements = elements
        
        if verifyExpressionValidity.canAddOperator {
            textView.text.append(" x ")
        } else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    /// Append the division operator symbol to textView.text if possible or display an alert
    /// - Parameter sender: The UIButton of the tapped operator symbol
    @IBAction func tappedDiviseButton(_ sender: UIButton) {
        
        guard let verifyExpressionValidity = verifyExpressionValidity else {
            return
        }
        
        verifyExpressionValidity.elements = elements
        
        if verifyExpressionValidity.canAddOperator {
            textView.text.append(" / ")
        } else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    /// Compute textView.text expression and displays the result or display an alert
    /// - Parameter sender: The UIButton of the tapped operator symbol
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        
        guard let verifyExpressionValidity = verifyExpressionValidity else {
            return
        }

        verifyExpressionValidity.elements = elements
        
        guard verifyExpressionValidity.expressionIsCorrect else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        
        guard verifyExpressionValidity.expressionHaveEnoughElement else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        
        //MARK: - Create local copy of operations
        
        let computeExpression = ComputeExpression(elements: elements)
        
        textView.text.append(" = \(computeExpression.operationsToReduce().first!)")
    }

}

