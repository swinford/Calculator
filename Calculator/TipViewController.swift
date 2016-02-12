//
//  TipViewController.swift
//  Calculator
//
//  Created by Zachary Swinford on 2/8/16.
//  Copyright © 2016 Swinford. All rights reserved.
//

import UIKit

class TipViewController: UIViewController, UITextFieldDelegate {
    
    // hidden labels
    @IBOutlet var t1: UILabel! //tip =
    @IBOutlet var t2: UILabel! //total =
    @IBOutlet var t3: UILabel! //person(s)
    @IBOutlet var t4: UILabel! //tip per person =
    @IBOutlet var t5: UILabel! //total per person =
    
    
    @IBOutlet var userInput: UITextField!
    @IBOutlet var tipPercentLabel: UILabel!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipSlider: UISlider!
    @IBOutlet var addPersonButton: UIStepper!
    @IBOutlet var numOfPeople: UILabel!
    @IBOutlet var tipPerPersonLabel: UILabel!
    @IBOutlet var totalPerPersonLabel: UILabel!
    
    var tipPercent = 0.0
    var amount = 0.0
    var tipPerPerson = 0.0
    var totalPerson = 0.0
    var numPeople = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Hide the labels until needed
        t1.hidden = true
        t2.hidden = true
        t4.hidden = true
        t5.hidden = true
        tipLabel.hidden = true
        totalLabel.hidden = true
        tipPerPersonLabel.hidden = true
        totalPerPersonLabel.hidden = true
        
        //Addition of the delegate and UITapRecognizer to accommodate a user tap to hide the keyboard
        userInput.delegate = self
        userInput.becomeFirstResponder()
        userInput.keyboardType = UIKeyboardType.DecimalPad
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func calculateTipandTotal () {
        //Calculate the results
        let tip = amount * tipPercent / 100
        let total = amount + tip
        tipPerPerson = tip / numPeople
        totalPerson = total / numPeople
        //Initialize number formatter/style
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        //Set the results to the labels
        tipLabel.text = numberFormatter.stringFromNumber(tip)
        totalLabel.text = numberFormatter.stringFromNumber(total)
        //Reveal the result labels
        t1.hidden = false
        tipLabel.hidden = false
        t2.hidden = false
        totalLabel.hidden = false
        
        if numPeople >  1.0 {
            tipPerPersonLabel.text = numberFormatter.stringFromNumber(tipPerPerson)
            totalPerPersonLabel.text = numberFormatter.stringFromNumber(totalPerson)
            t4.hidden = false
            tipPerPersonLabel.hidden = false
            t5.hidden = false
            totalPerPersonLabel.hidden = false
        } else {
            t4.hidden = true
            t5.hidden = true
            tipPerPersonLabel.hidden = true
            totalPerPersonLabel.hidden = true
        }
    }
    
    func dismissKeyboard() {
        //When the user taps outside of the userInput textField, hide the keyboard
        userInput.resignFirstResponder()
        userInput.endEditing(true)
    }
    
    @IBAction func numberOfPeopleChanged(sender: AnyObject) {
        //Addition of the number of people will reveal the labels and calculate a result
        numPeople = addPersonButton.value
        numOfPeople.text = "\(numPeople)"
        numOfPeople.hidden = false
        t3.hidden = false
        
        if (amount != 0.0) {
            calculateTipandTotal()
        }
    }

    
    @IBAction func tipSliderMoved(sender: AnyObject) {
        //Calculate the tip and total whenever the user moves the slider
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.PercentStyle
        tipPercentLabel.text = numberFormatter.stringFromNumber(Double(tipSlider.value) / 100.0)
        tipPercentLabel.hidden = false
        tipPercent = Double(tipSlider.value)
        
        if amount != 0.0 {
            calculateTipandTotal()
        }
    }
    
    @IBAction func calculateTipButtonPressed(sender: AnyObject) {
        //Calculate the results from the user entered balance
        amount = Double(NSString(string: userInput.text!).floatValue)
        calculateTipandTotal()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
