//
//  ConfirmViewController.swift
//  2GO
//
//  Created by Pat Khai on 11/6/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController {
    
    @IBOutlet weak var pickupLabel: UILabel!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var restaurantId: String!
    var phoneNumber: String!
    var name: String!
    var cart: [OrderItem]!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        phoneLabel.text = phoneNumber
    }
    
    @IBAction func didTapConfirm(_ sender: UIButton) {
        // Save on success
        let defaults = UserDefaults.standard
        defaults.set(phoneNumber, forKey:"phoneNumber")
        defaults.set(name, forKey:"usersName")
        defaults.synchronize()
        self.performSegue(withIdentifier: "checkout", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let orderViewController = segue.destination as! OrderViewController
        orderViewController.phoneNumber = phoneNumber
        orderViewController.buyerName = name
        orderViewController.restaurantId = restaurantId
        orderViewController.cart = cart
    }
}
