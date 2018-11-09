//
//  RestaurantViewController.swift
//  2GO
//
//  Created by Pat Khai on 10/17/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit
import ParseUI

class RestaurantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuSelection: UILabel!
    @IBOutlet weak var resRatings: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resName: UILabel!
    @IBOutlet weak var resNumber: UILabel!
    @IBOutlet weak var resAddress: UILabel!
    @IBOutlet weak var layoutView: UIView!
    
    var restaurant: Restaurant!
    
    var imageView = PFImageView()
    
    var resMenuItems: [MenuItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBAction func addtoCart(_ sender: UIButton) {
        sender.flash()
        guard let cell = sender.superview?.superview as? MenuTableViewCell else {
            return
        }
        
        let objectId = cell.menuItem.objectId!
        let defaults = UserDefaults.standard
        
        var cart = defaults.array(forKey:"cart") as! [String]
        if !cart.contains(objectId) {
            cart.append(objectId)
            defaults.set(cart, forKey: "cart")
            defaults.synchronize()
            alertControl("Menu Item Added!")
        } else {
            alertControl("Item Already in Cart.")
        }
    
    }
    
    func alertControl (_ title: String) {
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // get menu items
        let menuItemQuery = PFQuery(className: "MenuItem")
        menuItemQuery.whereKey("restaurant", equalTo: restaurant)
        
        menuItemQuery.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if error == nil, let items = objects {
                self.resMenuItems = items as! [MenuItem]
            } else {
                print("Error in restaurant query: \(error!)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "resDetail", for: indexPath) as! MenuTableViewCell
        
        cell.menuItem = resMenuItems[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 40, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }

    //initiation the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        
        let indexPath = tableView.indexPath(for: cell)!
        let viewController = segue.destination as! MenuViewController
        viewController.menu = resMenuItems[indexPath.row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 135

        resName.text = restaurant.name
        resNumber.text = restaurant.phoneNumber
        resAddress.text = "\(restaurant.street) \(restaurant.city) \(restaurant.state) \(restaurant.zipCode)"
        
        imageView.file = restaurant.photo
        imageView.loadInBackground()
        
        tableView.contentInset = UIEdgeInsetsMake(220, 0, 0, 0)
        tableView.backgroundColor = UIColor.white
        
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 376 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 400)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
}

