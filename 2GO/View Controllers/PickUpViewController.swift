//
//  LoginViewController.swift
//  2GO
//
//  Created by Pat Khai on 11/6/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

extension StringProtocol {
    //stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language Leo Dabus
    var string: String { return String(self) }
    
    subscript(offset: Int) -> Element {
        return self[index(startIndex, offsetBy: offset)]
    }
    
    subscript(_ range: CountableRange<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count)
            .suffix(range.count)
    }
    subscript(range: CountableClosedRange<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count)
            .suffix(range.count)
    }
    
    subscript(range: PartialRangeThrough<Int>) -> SubSequence {
        return prefix(range.upperBound.advanced(by: 1))
    }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence {
        return prefix(range.upperBound)
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence {
        return suffix(Swift.max(0, count - range.lowerBound))
    }
}
extension Substring {
    var string: String { return String(self) }
}


class PickUpViewController: UIViewController{

    @IBOutlet weak var titlePickup: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
    
    var restaurantId: String!
    var cart: [OrderItem]!
    
    var enabledColor = UIColor.init(red: 1.0, green: 0.576, blue: 0.0, alpha: 1.0)
    
    // phone number validation from stackoverflow.com/questions/27998409/email-phone-validation-in-swift user kirit Modi
    func validate(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    //same thing with username
    func validateName(value: String) -> Bool {
        let NAME_REGEX = ".*[^A-Za-z ].*"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", NAME_REGEX)
        let result =  nameTest.evaluate(with: value)
        return result
    }
   
    func disableButton() {
        doneButton.isEnabled = false
        doneButton.backgroundColor = UIColor.gray
    }
    
    func enableButton() {
        doneButton.backgroundColor = enabledColor
        doneButton.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.clearButtonMode = UITextFieldViewMode.whileEditing
        phoneNumberText.clearButtonMode = UITextFieldViewMode.whileEditing
        
        let defaults = UserDefaults.standard
        if( defaults.string(forKey: "usersName") != nil ){
            nameText.text = defaults.string(forKey: "usersName")
        }
        
        if( defaults.string(forKey: "phoneNumber") != nil) {
            phoneNumberText.text = defaults.string(forKey: "phoneNumber")
        }
        
        if( phoneNumberText.text!.count == 0 || nameText.text!.count == 0 ) {
           disableButton()
        }
        
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPhoneEdit(_ sender: UITextField) {
        let currentPhoneText = sender.text!
        let phoneLength = currentPhoneText.count
        
        if( phoneLength > 12) {
            sender.text?.removeLast()
        }
        
        if( phoneLength == 4 && currentPhoneText[3] != "-") {
            let lastChar = currentPhoneText[3]
            var newPhoneText = currentPhoneText.dropLast()
            newPhoneText = String(newPhoneText) + "-" + String(lastChar)
            sender.text = String(newPhoneText)
        }
        
        if( phoneLength == 8 && currentPhoneText[7] != "-") {
            let lastChar = currentPhoneText[7]
            var newPhoneText = currentPhoneText.dropLast()
            newPhoneText = String(newPhoneText) + "-" + String(lastChar)
            sender.text = String(newPhoneText)
        }
        
        if( phoneNumberText.text!.count > 0 && nameText.text!.count > 0 ) {
            enableButton()
        } else {
            disableButton()
        }
    }
    

    @IBAction func onNameEdit(_ sender: UITextField) {
        if( phoneNumberText.text!.count > 0 && nameText.text!.count > 0 ) {
            enableButton()
        } else {
            disableButton()
        }
    }
    
    @IBAction func didTapDone(_ sender: UIButton) {
        let phoneNumber = phoneNumberText.text!
        let name = nameText.text!
        
        if( name == "" ||  phoneNumber == "") {
            return
        }
        
        if( validateName(value: name) != false) {
            alertControl("Please enter a valid name")
            return
        }
        
        if( validate(value: phoneNumber) == false ) {
            alertControl("Please enter a valid phone number")
            return
        }
        self.performSegue(withIdentifier: "detail", sender: nil)
    }
    
    func alertControl(_ title: String) {
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let confirmViewController = segue.destination as! ConfirmViewController
        confirmViewController.restaurantId = restaurantId
        confirmViewController.cart = cart
        confirmViewController.name = nameText.text!
        confirmViewController.phoneNumber = phoneNumberText.text!
    }

}
