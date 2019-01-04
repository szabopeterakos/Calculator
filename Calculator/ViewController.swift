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
        case multiple = "x" // 13
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
    
    @IBAction func numbers(_ sender: UIButton) {
        responsiveDisplay()
        if (numMonitor.text?.count)! >= 10 {
            return
        }
        
        if(numMonitor.text=="0"){
            numMonitor.text = ""
        }
        let current = numMonitor.text! + String(sender.tag-1)
        print(current)
        numMonitor.text = current
        
    }
    
    //MARK: LOGIC
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
        numMonitor.font = numMonitor.font.withSize(100)
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
    
    func responsiveDisplay(){
        var currentFont = numMonitor.font
        
        if(numMonitor.text?.count)! >= 8 {
            currentFont = currentFont!.withSize(58)
        }else if(numMonitor.text?.count)! >= 6 {
            currentFont = currentFont!.withSize(80)
        }else{
            currentFont = currentFont!.withSize(100)
        }
    }
    
}

