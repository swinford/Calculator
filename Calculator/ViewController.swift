//
//  ViewController.swift
//  Calculator
//
//  Created by Zachary Swinford on 2/8/16.
//  Copyright © 2016 Swinford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UILabel!
    
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var numberZero: UIButton!
    @IBOutlet weak var decimalPoint: UIButton!
    @IBOutlet weak var plusMinusToggle: UIButton!
    @IBOutlet weak var acClear: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var subtraction: UIButton!
    @IBOutlet weak var addition: UIButton!
    @IBOutlet weak var deletion: UIButton!
    @IBOutlet weak var squareRoot: UIButton!
    @IBOutlet weak var mod: UIButton!
    @IBOutlet weak var exponent: UIButton!
    @IBOutlet weak var pi: UIButton!
    @IBOutlet weak var swift: UIButton!
    @IBOutlet weak var oneOver: UIButton!
    
    var typing:Bool = false
    var firstNumber: Float = 0.0
    var secondNumber: Float = 0.0
    var operation:String = ""
    var result: Float = 0.0
    
    var valueToPass: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        number1.layer.cornerRadius = number1.bounds.size.width / 8.0
        number2.layer.cornerRadius = number2.bounds.size.width / 8.0
        number3.layer.cornerRadius = number3.bounds.size.width / 8.0
        number4.layer.cornerRadius = number4.bounds.size.width / 8.0
        number5.layer.cornerRadius = number5.bounds.size.width / 8.0
        number6.layer.cornerRadius = number6.bounds.size.width / 8.0
        number7.layer.cornerRadius = number7.bounds.size.width / 8.0
        number8.layer.cornerRadius = number8.bounds.size.width / 8.0
        number9.layer.cornerRadius = number9.bounds.size.width / 8.0
        numberZero.layer.cornerRadius = numberZero.bounds.size.width / 8.0
        equalButton.layer.cornerRadius = equalButton.bounds.size.width / 8.0
        deletion.layer.cornerRadius = deletion.bounds.size.width / 8.0
        plusMinusToggle.layer.cornerRadius = plusMinusToggle.bounds.size.width / 8.0
        decimalPoint.layer.cornerRadius = decimalPoint.bounds.size.width / 8.0
        acClear.layer.cornerRadius = acClear.bounds.size.width / 8.0
        addition.layer.cornerRadius = addition.bounds.size.width / 8.0
        divide.layer.cornerRadius = divide.bounds.size.width / 8.0
        multiply.layer.cornerRadius = multiply.bounds.size.width / 8.0
        subtraction.layer.cornerRadius = subtraction.bounds.size.width / 8.0
        squareRoot.layer.cornerRadius = squareRoot.bounds.size.width / 8.0
        mod.layer.cornerRadius = number1.bounds.size.width / 8.0
        exponent.layer.cornerRadius = number2.bounds.size.width / 8.0
        pi.layer.cornerRadius = number3.bounds.size.width / 8.0
        swift.layer.cornerRadius = number4.bounds.size.width / 8.0
        oneOver.layer.cornerRadius = number5.bounds.size.width / 8.0
        
    }
    
    @IBAction func numberPressed(sender: AnyObject) {
        // set the variable "number" to whichever number the user presses
        let number = sender.currentTitle!
        
        if typing {
            outputDisplay.text = outputDisplay.text! + String(number!)
        } else {
            outputDisplay.text = number!
        }
        typing = true
    }
    
    @IBAction func calculationPressed(sender: AnyObject) {
        typing = false
        firstNumber = Float(outputDisplay.text!)!
        operation = sender.currentTitle!!
    }

    @IBAction func equalPressed(sender: AnyObject) {
        secondNumber = Float(outputDisplay.text!)!
        typing = false
        
        //arithmetic operations
        if operation == "+" {
            result = firstNumber + secondNumber
        }
        else if operation == "-" {
            result = firstNumber - secondNumber
        }
        else if operation == "✕" {
            result = firstNumber * secondNumber
        }
        else if operation == "÷" {
            result = firstNumber / secondNumber
        }
        else if operation == "%" {
            result = firstNumber % secondNumber
        }
        else if operation == "x^y" {
            result = pow(firstNumber, secondNumber)
        }
        else if operation == "√" {
            result = sqrt(firstNumber)
        }

        outputDisplay.text = "\(result)"
    }
    
    @IBAction func squareRoot(sender: AnyObject) {
        result = sqrt(Float(outputDisplay.text!)!)
        outputDisplay.text = "\(result)"

    }
    
    @IBAction func deletePressed(sender: AnyObject) {
        if outputDisplay.text!.characters.count != 0 {
            outputDisplay.text = outputDisplay.text!.substringToIndex(outputDisplay.text!.endIndex.predecessor())
        }
        else{
            outputDisplay.text = "0"
        }
        
    }
    
    @IBAction func plusMinus(sender: AnyObject) {
        if( outputDisplay.text![outputDisplay.text!.startIndex] == "-"){
            outputDisplay.text!.removeAtIndex(outputDisplay.text!.startIndex)
        }else{
            outputDisplay.text!.insert("-", atIndex: outputDisplay.text!.startIndex)
        }
    }
    @IBAction func pi(sender: AnyObject) {
        outputDisplay.text = "3.14159265359"
    }
    
    @IBAction func factorial(sender: AnyObject) {
        
        let result = factorialFunction(Int(Float(outputDisplay.text!)!))
        let floatResult = Float(result)
        outputDisplay.text = "\(floatResult)"
    }
    
    func factorialFunction(n: Int) -> Int {
        return n == 0 ? 1 : n * factorialFunction(n-1)
    }
    
    @IBAction func oneOver(sender: AnyObject) {
        result = 1 / Float(outputDisplay.text!)!
        outputDisplay.text = "\(result)"
    }

    
    @IBAction func decimal(sender: AnyObject) {
        let decimal = sender.currentTitle!
        outputDisplay.text = outputDisplay.text! + decimal!
    }
    
    @IBAction func clear(sender: AnyObject) {
        result = 0
        firstNumber = 0
        secondNumber = 0
        outputDisplay.text = "0"
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

