//
//  LoginViewController.swift
//  2GO
//
//  Created by Pat Khai on 11/6/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

class PickUpViewController: UIViewController {

    @IBOutlet weak var titlePickup: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
    
    var restaurantId: String!
    var cart: [OrderItem]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDone(_ sender: UIButton) {
        self.performSegue(withIdentifier: "detail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let confirmViewController = segue.destination as! ConfirmViewController
        confirmViewController.restaurantId = restaurantId
        confirmViewController.cart = cart
    }

}
