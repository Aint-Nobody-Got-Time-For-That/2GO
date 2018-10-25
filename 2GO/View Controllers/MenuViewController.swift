//
//  MenuViewController.swift
//  2GO
//
//  Created by Pat Khai on 10/17/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuDescription: UILabel!
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var menuCost: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var menuImage: UIImageView!
    
    var menu: MenuItem!
    
    var counterItem = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTitle.text = menu.description
        menuImage.af_setImage(withURL: URL(string: menu.photo[0])!)
        menuDescription.text = menu.menuDescription
        menuCost.text = String("$\(menu.menuCost)")
        subView.layer.cornerRadius = 5
        subView.clipsToBounds = true
        self.tabBarController?.tabBar.isHidden = false
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func savetoCart(_ sender: UIButton) {
        self.performSegue(withIdentifier: "cart", sender: nil)
    }
    
    @IBAction func addtoCart(_ sender: UIButton) {
        
        // Display a message to the user
        //        if let menuItems = self.menu {
        //            Restaurant.init(id: <#T##Int#>, name: <#T##String#>, photos: <#T##[String]#>, categories: <#T##[String]#>, address: <#T##String#>, latitude: <#T##Double#>, longitude: <#T##Double#>, phoneNumber: <#T##String#>, menuItems: <#T##[MenuItem]#>)
        //        }
        //
        alertControl()
        
        
        
    }
    
    func alertControl () {
        let alertController = UIAlertController(title: "Menu Item Added!", message: "Try a new one" , preferredStyle: .alert)
        //        let cancelAction = UIAlertAction(title: "Cancel", style: .default) {(action) in
        
        //        }
        //        alertController.addAction(cancelAction)
        let OKAction = UIAlertAction(title: "OK", style: .cancel) { (action) in }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
            
        }
    }
    
    
    
    
    @IBAction func exitTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
