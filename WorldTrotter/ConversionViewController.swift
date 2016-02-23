//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Paulina Levit on 2/7/16.
//  Copyright © 2016 Paulina Levit. All rights reserved.
//

import UIKit

class ConversionViewController : UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewContoller loaded its view")
    }
    
    override func viewDidAppear(animated: Bool) {
        let hour = NSCalendar.currentCalendar().component(.Hour, fromDate: NSDate())
        if (hour < 8 || hour > 17){
            self.view.backgroundColor = UIColor.grayColor()
        }
    }
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField){
        //celsiusLabel.text = textField.text
//        if let text = textField.text where !text.isEmpty {
//            celsiusLabel.text = text
//        }
//        else {
//            celsiusLabel.text = "???"
//        }
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        }
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else {
            return nil
        }
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            //celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharacterInRange range: NSRange,
        replacementString string: String) -> Bool {
//            print("Current text: \(textField.text)")
//            print("Replacement text: \(string)")
//            
//            return true

        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        
        let validCharacters = NSCharacterSet(charactersInString: "-.,0123456789")
         
        if (string.stringByTrimmingCharactersInSet(validCharacters).characters.count > 0){
            return false
        }
        else if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        }
        else {
            return true
        }
    }
    
    
}
