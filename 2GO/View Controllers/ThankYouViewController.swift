//
//  ThankYouViewController.swift
//  2GO
//
//  Created by Pat Khai on 11/6/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

class ThankYouViewController: UIViewController {

    @IBOutlet weak var thankyouLabel: UILabel!
    @IBOutlet weak var orderReadyLabel: UILabel!
    
    @IBAction func didTapOK(_ sender: UIButton) {
        self.performSegue(withIdentifier: "home", sender: nil)
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
