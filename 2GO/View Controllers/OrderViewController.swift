//
//  OrderViewController.swift
//  2GO
//
//  Created by Pat Khai on 11/6/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var lineImage: UIImageView!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var weAcceptLabel: UILabel!
    @IBOutlet weak var paymentMethodLabel: UIImageView!
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var expireLabel: UILabel!
    @IBOutlet weak var securityCodeLabel: UILabel!
    
    
    
    @IBOutlet weak var cardNameText: UITextField!
    @IBOutlet weak var cardNumberText: UITextField!
    
    @IBOutlet weak var expireText: UITextField!
    @IBOutlet weak var securityText: UITextField!
    
    @IBOutlet weak var checkoutButton: UIButton!
    
    
    
    @IBAction func didTapCheckout(_ sender: UIButton) {
        self.performSegue(withIdentifier: "thankyou", sender: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
