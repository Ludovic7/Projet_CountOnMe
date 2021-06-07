//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - @IB Outlet

    // communication avec le storyboard
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    // MARK: - Properties

    let countModele = CountModele()

    // MARK: - Methodes
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        countModele.countModeleDelegate = self
    }
    
    // MARK: - @IB Action

    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        countModele.tappedNumberButton(numberText: numberText)
        
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        countModele.tappedAdditionButton()
        
      
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        countModele.tappedSubstractionButton()
     
    }
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        countModele.tappedMultiplicationButton()
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        countModele.tappedDivisionButton()
    }
    
  
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        countModele.tappedEqualButton()
  
    }
        
       
    @IBAction func tappedACButton(_ sender: UIButton) {
        countModele.tappedACButton()
    }

}

// MARK: - Extension

// delagate, communication ac le Modele
extension ViewController: CountModeleDelegate{
    func didResult(calcul: String) {
        textView.text = calcul
    }
    func didAlert(message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return self.present(alertVC, animated: true, completion: nil)
    }
}

