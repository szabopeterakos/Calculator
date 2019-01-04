//
//  ViewController.swift
//  Calculator
//
//  Created by Szabó Péter on 2019. 01. 04..
//  Copyright © 2019. Szabó Péter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: PROPERTIES
    enum OPERATOR: String{
        case addition = "+" // 14
        case substraction = "-" // 15
        case divide = "/" // 12
        case multiple = "*" // 13
        case equals = "=" // 16
    }
    
    @IBOutlet weak var numMonitor: UILabel!
    
    var currentOperator: OPERATOR!
    
    @IBOutlet weak var testDisplayArea: UIButton!
    
    var isNegate: Bool = false
    
    //MARK: INIT
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: LOGIC
    @IBAction func numbers(_ sender: UIButton) {
        if(numMonitor.text=="0"){
            numMonitor.text = ""
        }
        let current = numMonitor.text! + String(sender.tag-1)
        print(current)
        numMonitor.text = current
    }
    
    @IBAction func operators(_ sender: UIButton) {
        var currentOperator : OPERATOR!
        
        switch sender.tag {
        case 12:
            currentOperator = OPERATOR.divide
        case 13:
            currentOperator = OPERATOR.multiple
        case 14:
            currentOperator = OPERATOR.substraction
        case 15:
            currentOperator = OPERATOR.addition
        case 16:
            currentOperator = OPERATOR.equals
        default:
            print("something goes wrong")
        }
        
        testDisplayArea.setTitle(currentOperator.rawValue, for: .normal)
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        numMonitor.text = "0"
    }
    
    @IBAction func negationControl(_ sender: UIButton) {
        print(isNegate)
        isNegate = !isNegate
        if isNegate {
            numMonitor.text = "-" + numMonitor.text!
        } else {
            if (numMonitor.text?.hasPrefix("-"))!{
                numMonitor.text = String(numMonitor.text!.dropFirst())
            }
        }
    }
    
}

