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
    @IBOutlet weak var resImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resName: UILabel!
    @IBOutlet weak var resNumber: UILabel!
    @IBOutlet weak var resAddress: UILabel!
    
    var restaurant: Restaurant!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.reloadData()
        
        tableView.rowHeight = 145
        
        resName.text = restaurant.name
        resNumber.text = restaurant.phoneNumber
        resAddress.text = restaurant.address
        resImage.af_setImage(withURL: URL(string: restaurant.photos[0])!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurant.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "resDetail", for: indexPath) as! MenuTableViewCell

        cell.menuItem = restaurant.menuItems[indexPath.item]
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
