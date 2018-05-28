//
//  ViewController.swift
//  Simple_Calculator
//
//  Created by Alexander Bondarenko on 28.05.2018.
//  Copyright © 2018 Alexander Bondarenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var x:Double = 0    //текущий набор цифр (пока набираем)
    var y:Double!       //промежуточное значние набора (буфер предыдщуего значения)
    
    var operation:NSInteger = 0 //код операции
    
    var enterFlag:Bool = false
    var yFlag = false
    
    @IBOutlet weak var displayLabel: UILabel!
    
    let operations = (
        plus:   1001,
        minus:  1002,
        multi:  1003,
        divide: 1004
    )
    
    @IBAction func clearAll() {
        x = 0
        y = 0
        
        enterFlag = false
        yFlag = false
        
        printInScreen()
    }
    
    @IBAction func clear() {
        x = 0
        
        printInScreen()
    }
    
    @IBAction func digit(_ sender: AnyObject) {
        
        if enterFlag == true {
            y = x
            x = 0
            enterFlag = false
        }
        x = (10 * x) + Double(sender.tag)
        
//        x = Double(sender.tag)
        
//        print("\(sender.tag)")
        
        printInScreen()
    }
    
    @IBAction func operation(_ sender: AnyObject) {
//        print("Touch = \(sender.tag)")
//        print("\(sender.tag)")
        if yFlag && !enterFlag {
            switch operation {
                case operations.plus: x = y + x
                case operations.minus: x = y - x
                case operations.multi: x = y * x
                case operations.divide: x = y / x
            default:
                break
            }
            
            //            if enterFlag == false {
//            if (operation == 1001) {
//                x = y + x
//            }
//            if (operation == 1002) {
//                x = y - x
//            }
//            if (operation == 1003) {
//                x = y * x
//            }
//            if (operation == 1004) {
//                x = y / x
//            }
            //            }
        }
        
        y = x
        enterFlag = true
        yFlag = true
        operation = sender.tag
        printInScreen()
    }
    
    @IBAction func inverse() {
        x = -x
        printInScreen()
    }
    
    func printInScreen() {
//        print("Ok")
        
        let str:String = String.init(format:"%g", x)
        displayLabel.text = str
    }
    
}

