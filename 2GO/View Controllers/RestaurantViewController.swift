//
//  RestaurantViewController.swift
//  2GO
//
//  Created by Pat Khai on 10/17/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lineImage: UIImageView!
    @IBOutlet weak var menuSelection: UILabel!
    @IBOutlet weak var resRatings: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resName: UILabel!
    @IBOutlet weak var resNumber: UILabel!
    @IBOutlet weak var resAddress: UILabel!
    @IBOutlet weak var layoutView: UIView!
    //    @IBOutlet weak var imageLayoutView: UIView!
    
    var restaurant: Restaurant!
    
    var imageView = UIImageView()
    
    let tableHeaderHeight: CGFloat = 10.0  // CHALLENGE: make this 4/5 of the screen height
    let tableHeaderCutAway: CGFloat = 40.0
    
    var headerMaskLayer: CAShapeLayer!
    
    
    @IBAction func addtoCart(_ sender: UIButton) {
        alertControl()
    }
    
    func alertControl () {
        let alertController = UIAlertController(title: "Menu Item Added!", message: "Try a new one" , preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurant.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "resDetail", for: indexPath) as! MenuTableViewCell
        
        cell.menuItem = restaurant.menuItems[indexPath.item]
        return cell
    }
    

    //initiation the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        
        let indexPath = tableView.indexPath(for: cell)!
        let viewController = segue.destination as! MenuViewController
        viewController.menu = restaurant.menuItems[indexPath.row]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 145
        
        resName.text = restaurant.name
        resNumber.text = restaurant.phoneNumber
        resAddress.text = restaurant.address
        //        resImage.af_setImage(withURL: URL(string: restaurant.photos[0])!)
        imageView.af_setImage(withURL: URL(string: restaurant.photos[0])!)
        
        tableView.contentInset = UIEdgeInsetsMake(243, 0, 0, 0)
        tableView.backgroundColor = UIColor.white
        
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        print("here")
        
        
        
    }
   
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 365 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 400)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
        
    }
    
}

