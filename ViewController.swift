//
//  ViewController.swift
//  hesapmakinesideneme
//
//  Created by Mahir Kaan Küçükgençay on 28.02.2024.
//

import UIKit

enum Operation {
  case add, subtract, multiply, divide, unknown
}

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{
    var currentOperation: Operation = .unknown
    

    var firstNumber = ""
    var secondNumber = ""
    var result = 0
    var resultInt = 0
    var num1 = 0
    var num2 = 0
    
    @IBOutlet weak var resultScreen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
  
    

    @IBAction func operateButton(_ sender: UIButton) {
        print("Operator button pressed: \(sender.tag)")
        firstNumber = resultScreen.text!
        resultScreen.text = ""

        switch sender.tag {
        case 11:
            currentOperation = .add
            print("Toplama Islemi")
        case 12:
            currentOperation = .subtract
            print("Cikarma Islemi")
        case 13:
            currentOperation = .multiply
            print("Carpma Islemi")
        case 14:
            currentOperation = .divide
            print("Bolme Islemi")
        default:
            currentOperation = .unknown
            
        }
    }
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if resultScreen.text == "0" {
            resultScreen.text = String(sender.tag)
        } else {
            resultScreen.text = resultScreen.text! + String(sender.tag)
        }
        
        
        
    }
    
        

       
    @IBAction func clearButton(_ sender: UIButton) {
        
            resultScreen.text = "0"
        
    }
    
    
   


    @IBAction func equalButton(_ sender: UIButton) {
        print("Equal button pressed")
        secondNumber = resultScreen.text!
        print("Number1: \(firstNumber), Number2: \(secondNumber), Operation: \(currentOperation)")

        if let num1 = Int(firstNumber), let num2 = Int(secondNumber) {
            switch currentOperation {
            case .add:
                resultInt = Int(num1 + num2)
            case .subtract:
                resultInt = Int(num1 - num2)
            case .multiply:
                resultInt = Int( num1 * num2)
            case .divide:
                resultInt = num1 / num2
            default:
                print("Unknown operation")
            }
            print("Calculation result: \(resultInt)")
            resultScreen.text = String(resultInt)
            currentOperation = .unknown
        } else {
            print("Number conversion failed")
            resultScreen.text = "Error"
        }
    }


    


    


  }



