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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapConfirm(_ sender: UIButton) {
        self.performSegue(withIdentifier: "thankyou", sender: nil)
    }
    
    @IBAction func didTapEdit(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
