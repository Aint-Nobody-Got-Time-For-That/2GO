//
//  MenuViewController.swift
//  2GO
//
//  Created by Pat Khai on 10/17/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit
import AlamofireImage
import ParseUI

class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuDescription: UILabel!
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var menuCost: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var menuImage: PFImageView!
    
    var menu: MenuItem!
    var counterItem = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTitle.text = menu.name
        menuImage.file = menu.photo
        menuDescription.text = menu.menuItemDescription
        menuCost.text = "$\(menu.price)"
        subView.layer.cornerRadius = 5
        subView.clipsToBounds = true
        self.tabBarController?.tabBar.isHidden = false
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func savetoCart(_ sender: UIButton) {
        self.performSegue(withIdentifier: "menuDetail", sender: nil)
    }
    
    @IBAction func addtoCart(_ sender: UIButton) {
        
        let objectId = menu.objectId!
        let defaults = UserDefaults.standard
        
        var cart = defaults.array(forKey:"cart") as! [String]
        if !cart.contains(objectId) {
            cart.append(objectId)
            defaults.set(cart, forKey: "cart")
            defaults.synchronize()
            alertControl("Dish Added!")
        } else {
            alertControl("Already in Cart.")
        }
        
    }
    
    func alertControl(_ title: String) {
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
            
        }
    }
    
//        //initiation the segue
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            let menuData = segue.destination as! CartViewController
    
//        }
    
//
//
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "menuDetail"{
//                let menuVC: CartViewController = segue.destination as! CartViewController
//                menuVC.menuItem =
//            }
//        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
