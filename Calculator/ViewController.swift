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
        case addition = "+" // tag14
        case substraction = "-" // tag15
        case divide = "/" // tag12
        case multiple = "x" // tag13
        case equals = "=" // tag16
    }
    @IBOutlet weak var numMonitor: UILabel!
    var currentOperator: OPERATOR!
    @IBOutlet weak var testDisplayArea: UIButton!
    @IBOutlet weak var previousNumberDisplay: UILabel!
    var isNegate: Bool = false
    var previousValue: String = "0"
    var previousOperation: OPERATOR!
    var inOperation = false
    var sum = 0.0
    var baseColor: UIColor = UIColor.init(red: 0.33, green: 0.51, blue: 0.79, alpha: 1)
    var resultColor: UIColor = UIColor.init(red: 0.14, green: 0.26, blue: 0.47, alpha: 1)
    
    //MARK: INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        numMonitor.textColor = baseColor
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        responsiveDisplay()
        
        if (numMonitor.text?.count)! >= 10 {
            return
        }
        
        initZero(sender)
        
        let current = numMonitor.text! + String(sender.tag-1)
        numMonitor.text = current
    }
    
    //MARK: LOGIC
    @IBAction func operators(_ sender: UIButton) {
        if(previousOperation == nil && numMonitor.text == ""){
            return
        }
        
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
            doOperate()
            responsiveDisplay()
            sum = 0
            
            return
        default:
            print("something goes wrong")
        }
        
        previousValue = numMonitor.text!
        previousNumberDisplay.text = previousValue
        previousOperation = currentOperator
        numMonitor.text = ""
        testDisplayArea.setTitle(currentOperator.rawValue, for: .normal)
        inOperation = true
        
    }
    
    func checkNull(){
        if(numMonitor.text == ""){
            numMonitor.text = "0"
        }
        if(previousValue == ""){
            previousValue = "0"
        }
    }
    
    func doOperate(){
        checkNull()
        
        if previousOperation.rawValue.hasPrefix("+"){
            sum = Double(previousValue)! + Double(numMonitor.text!)!
        }else if previousOperation.rawValue.hasPrefix("-"){
            sum = Double(previousValue)! - Double(numMonitor.text!)!
        }else if previousOperation.rawValue.hasPrefix("x"){
            sum = Double(previousValue)! * Double(numMonitor.text!)!
        }else if previousOperation.rawValue.hasPrefix("/"){
            sum = Double(previousValue)! / Double(numMonitor.text!)!
        }
        
        // check is nice integer
        numMonitor.textColor = resultColor
        if (sum.isNaN || sum.isInfinite) {
            numMonitor.text = "it's a tricky one"
        }else if floor(sum) == sum {
            numMonitor.text = String(Int(sum))
        }else{
            let num: String = String(sum).count>=10 ? String(String(sum).prefix(10)) : String(sum)
            numMonitor.text = num
        }
        
        // post functions
        previousNumberDisplay.text = ""
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        numMonitor.text = "0"
        numMonitor.font = numMonitor.font.withSize(100)
        testDisplayArea.setTitle("", for: .normal)
        previousNumberDisplay.text = ""
        previousValue = "0"
        numMonitor.textColor = baseColor
        sum = 0
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
        let currentFont = numMonitor.font
        
        if(numMonitor.text?.count)! >= 8 {
            numMonitor.font = currentFont!.withSize(58)
        }else if(numMonitor.text?.count)! >= 6 {
            numMonitor.font = currentFont!.withSize(80)
        }else{
            numMonitor.font = currentFont!.withSize(100)
        }
    }
    
    func initZero(_ sender: UIButton){
        if(numMonitor.text=="0"){
            numMonitor.text = ""
        }else if(numMonitor.text=="-0"){
            numMonitor.text = "-"
        }
    }
    
}

