//
//  WelcomeViewController.swift
//  2GO
//
//  Created by Pat Khai on 11/8/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var appLogoLabel: UILabel!
    @IBOutlet weak var dontLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    
    @IBOutlet weak var bgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundButton()
        
        appLogoLabel.alpha = 0
        dontLabel.alpha = 0
        foodLabel.alpha = 0
        playButton.alpha = 0
        bgImage.alpha = 0
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1, animations: {
            self.bgImage.alpha = 0.6
        }) {(true) in
            self.showLogo()
        }
    }
    
    
    func showLogo() {
        UIView.animate(withDuration: 1, animations: {
            self.appLogoLabel.alpha = 1
        }) {(true) in
            self.dontWait()
        }
    }
    
    
    func dontWait() {
        UIView.animate(withDuration: 1, animations: {
            self.dontLabel.alpha = 1
        }) {(true) in
            self.foodAndButton()
        }
    }
    
    
    func foodAndButton() {
        UIView.animate(withDuration: 1, animations: {
            self.playButton.alpha = 1
            self.foodLabel.alpha = 1
        })
    }
    
    @IBAction func didTapStart(_ sender: UIButton) {
        self.performSegue(withIdentifier: "start", sender: nil)
    }
    
    
    func roundButton() {
        playButton.layer.borderWidth = 4
        playButton.layer.masksToBounds = false
        playButton.layer.borderColor = UIColor.clear.cgColor
        playButton.layer.cornerRadius = playButton.frame.height/2
        playButton.clipsToBounds = true
        playButton.contentMode = .scaleAspectFill
    }
}
