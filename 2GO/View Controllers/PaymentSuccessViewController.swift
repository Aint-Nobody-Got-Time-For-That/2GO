//
//  ConfirmPayViewController.swift
//  2GO
//
//  Created by Pat Khai on 11/6/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

class PaymentSuccessViewController: UIViewController {

    @IBOutlet weak var paymentLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapOK(_ sender: UIButton) {
       self.performSegue(withIdentifier: "pickup", sender: nil)
    }
    
    
    

}
