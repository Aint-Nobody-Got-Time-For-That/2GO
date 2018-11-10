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
    
    var restaurantId: String!
    var cart: [OrderItem]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapConfirm(_ sender: UIButton) {
        self.performSegue(withIdentifier: "checkout", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let orderViewController = segue.destination as! OrderViewController
        orderViewController.phoneNumber = "925-812-7778"
        orderViewController.buyerName = "John Wayne"
        orderViewController.restaurantId = restaurantId
        orderViewController.cart = cart
    }
    
    @IBAction func didTapEdit(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
