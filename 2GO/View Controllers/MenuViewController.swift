//
//  MenuViewController.swift
//  2GO
//
//  Created by Pat Khai on 10/17/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit
import AlamofireImage

//protocol DataSentDelegate {
//    func userAddData(data: MenuItem)
//}

class MenuViewController: UIViewController   {
    
    @IBOutlet weak var menuDescription: UILabel!
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var menuCost: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var addCartButton: UIButton!
    
    var menu: MenuItem!
//    var delegate: DataSentDelegate? = nil
    
    var counterItem = 0
    //    var title: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTitle.text = menu.description
        menuImage.af_setImage(withURL: URL(string: menu.photo[0])!)
        menuDescription.text = menu.menuDescription
        menuCost.text = String("$\(menu.menuCost)")
        subViewEdit()
        menuImage.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        menuImage.contentMode = .scaleAspectFill
        menuImage.clipsToBounds = true
        view.insertSubview(subView, aboveSubview: menuImage!)
        editButton()
        
        // Do any additional setup after loading the view.
    }
    func editButton() {
        addCartButton.layer.cornerRadius = 8
    
    }
    
    func subViewEdit() {
        subView.layer.cornerRadius = 8
        subView.layer.shadowRadius = 3.0
        subView.layer.shadowOpacity = 2.0
        subView.layer.shadowColor = UIColor.gray.cgColor
        subView.layer.shadowOffset = CGSize(width: 0, height: 5.0)
    
    }
    
    @IBAction func savetoCart(_ sender: UIButton) {
        self.performSegue(withIdentifier: "menuDetail", sender: nil)
    }
    
    @IBAction func addtoCart(_ sender: UIButton) {
        alertControl()
    }
    
    func alertControl () {
        let alertController = UIAlertController(title: "Menu Item Added!", message: "Try a new one" , preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
            
        }
    }
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 376 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 400)
        menuImage.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
    
    
}
