//
//  RestaurantViewController.swift
//  2GO
//
//  Created by Pat Khai on 10/17/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var lineImage: UIImageView!
    @IBOutlet weak var menuSelection: UILabel!
    @IBOutlet weak var resRatings: UIImageView!
    @IBOutlet weak var resImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resName: UILabel!
    @IBOutlet weak var resNumber: UILabel!
    
    let resPhotos = ["Carnitas Taco with Cheese", "El Pollo Chicken", "El Pastor Taco", "Fish Tacos with Salsa", "Hot Spicy Pork Tacos", "El Cookie Butter Taco", "Chicken Quesadillas", "Steak Burrito"]
    
    let resCosts = ["$7.99","$9.99","$6.99","$4.99","$6.99","$8.99","$12.99","$11.99","$10.99",]
    let resImages = [
        
        UIImage(named: "taco1")!,
        UIImage(named: "taco2")!,
        UIImage(named: "taco3")!,
        UIImage(named: "taco4")!,
        UIImage(named: "taco5")!,
        UIImage(named: "taco6")!,
        UIImage(named: "taco7")!,
        UIImage(named: "taco8")!,
        ]
    
    var image = UIImage()
    var name = ""
    
    @IBAction func didTapAdd(_ sender: UIButton) {
    }
    
    @IBOutlet weak var resAddress: UILabel!
    var restaurant: [Restaurant]? = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.reloadData()
        
        tableView.rowHeight = 145
//        tableView.estimatedRowHeight = 100
        resImage.image = image
        resName.text! = name
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "resDetail", for: indexPath) as! MenuTableViewCell
        cell.menuImage.layer.borderWidth = 4
        cell.menuImage.layer.masksToBounds = false
        cell.menuImage.layer.borderColor = UIColor.clear.cgColor
        cell.menuImage.layer.cornerRadius = cell.menuImage.frame.height/2
        cell.menuImage.clipsToBounds = true
        cell.menuImage.image = resImages[indexPath.row]
        
        cell.menuTitle.text = resPhotos[indexPath.row]
        cell.menuCost.text = resCosts[indexPath.row]
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
