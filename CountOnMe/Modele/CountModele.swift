//
//  CountModele.swift
//  CountOnMe
//
//  Created by Ludovic DANGLOT on 11/05/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

protocol CountModeleDelegate {
    func didResult(calcul: String)
    func didAlert(message: String)
}

class CountModele {
    
    // MARK: - Properties
    
    var countModeleDelegate: CountModeleDelegate?
    
    var calculText : String = "" {
        didSet {
            countModeleDelegate?.didResult(calcul: calculText)
        }
    }
    
    var elements: [String] {
        return calculText.split(separator: " ").map { "\($0)" }
    }
    
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    // il doit y avoir au moins trois element avant le =
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    // ne peut avoir un signe d'operation comme dernier charactere, doit contenir au moins un element avant un operateur
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/" && elements.count != 0
    }
    
    // recherche le signe egal
    var expressionHaveResult: Bool {
        return calculText.firstIndex(of: "=") != nil
    }
    
    // MARK: - Methodes
    
    func tappedEqualButton ()  {
        guard expressionIsCorrect else {
            countModeleDelegate?.didAlert(message: "Entrez une expression correcte!")
            return
        }
        
        guard expressionHaveEnoughElement else {
            countModeleDelegate?.didAlert(message: "Démarrez un nouveau calcul !")
            return
        }
        // Create local copy of operations
        var operationsToReduce = priorityCalcul(expression: elements)
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            
            guard let left = Double(operationsToReduce[0])else{return}
            let operand = operationsToReduce[1]
            guard let right = Double(operationsToReduce[2])else{return}
            
            let result: Double
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
           
            default:
                return
            }
            
            // enleve les 3 premiers elements du tableau
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            // insert le resultat de celui ci a la place
            operationsToReduce.insert("\(result)", at: 0)
        }
        // le resultat est le premier chiffre du tableau et le seul
        guard let result = operationsToReduce.first else { return  }
        calculText.append(" = \(result) ")
        // eneleve le .0
        calculText = calculText.replacingOccurrences(of: ".0 ", with: "")
    }
    
    func priorityCalcul(expression : [String]) -> [String] {
            var tempExpression = expression
        while tempExpression.contains("x") || tempExpression.contains("/"){
            if let index = tempExpression.firstIndex(where: { $0 == "x" || $0 == "/"}) {
                let mathOperator = tempExpression[index]
                guard let left = Double(tempExpression[index - 1]) else { return [] }
                guard let right = Double(tempExpression[index + 1]) else { return [] }
                let result :  Double
                if mathOperator == "x" {
                    result = left * right
                } else {
                    guard !(right == 0) else {
                      countModeleDelegate?.didAlert(message: "Divisez par zero est impossible")
                      return []
                    }
                    result = left / right
                }
                tempExpression[index - 1] = String(result)
                tempExpression.remove(at: index + 1)
                tempExpression.remove(at: index)
            }
        }
        
        return tempExpression
    }
    
    func tappedNumberButton(numberText : String) {
        if expressionHaveResult {
            calculText = ""
        }
        calculText.append(numberText)
    }
    
    func tappedAdditionButton() {
        if expressionHaveResult{
            countModeleDelegate?.didAlert(message: "Démarrez un nouveau calcul !")
        } else {
            if canAddOperator {
                calculText.append(" + ")
            } else {
                countModeleDelegate?.didAlert(message: "Un operateur est déja mis !")
            }
        }
     
    }
    
    func tappedSubstractionButton () {
        if expressionHaveResult{
            countModeleDelegate?.didAlert(message: "Démarrez un nouveau calcul !")
        } else {
        if canAddOperator {
            calculText.append(" - ")
        } else {
            countModeleDelegate?.didAlert(message: "Un operateur est déja mis !")
        }
        }
    }
    
    func tappedMultiplicationButton() {
        if expressionHaveResult{
            countModeleDelegate?.didAlert(message: "Démarrez un nouveau calcul !")
        } else {
        if canAddOperator {
            calculText.append(" x ")
        } else {
            countModeleDelegate?.didAlert(message: "Un operateur est déja mis !")
        }
        }
    }
    
    func tappedDivisionButton() {
        if expressionHaveResult{
            countModeleDelegate?.didAlert(message: "Démarrez un nouveau calcul !")
        } else {
        if canAddOperator {
            calculText.append(" / ")
        } else {
            countModeleDelegate?.didAlert(message: "Un operateur est déja mis !")
        }
        }
    }
    
    func tappedACButton() {
        calculText = ""
    }
}



