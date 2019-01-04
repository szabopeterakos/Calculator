//
//  ViewController.swift
//  Calculator
//
//  Created by Szabó Péter on 2019. 01. 04..
//  Copyright © 2019. Szabó Péter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numMonitor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if(numMonitor.text=="0"){
            numMonitor.text = ""
        }
        let current = numMonitor.text! + String(sender.tag-1)
        print(current)
        numMonitor.text = current
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        numMonitor.text = "0"
    }
    
}

