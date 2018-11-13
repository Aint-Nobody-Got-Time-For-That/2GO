//
//  CartViewController.swift
//  2GO
//
//  Created by Pat Khai on 10/24/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit
import Parse

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CartTableViewCellDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var orderButton: UIButton!
    
    var total = 0.0
    var delete = false
    var enabledColor = UIColor.init(red: 1.0, green: 0.576, blue: 0.0, alpha: 1.0)
    
    var resMenuItems: [MenuItem] = [] {
        didSet {
            if(!delete) {
                tableView.reloadData()
            }
        }
    }
    
    func disableButton() {
        orderButton.isEnabled = false
        orderButton.backgroundColor = UIColor.gray
    }
    
    func enableButton() {
        orderButton.isEnabled = true
        orderButton.backgroundColor = enabledColor
    }
    
    func cartTableViewCellDidTapAdd(_ sender: CartTableViewCell) {
        let defaults = UserDefaults.standard
        var currentAmount = defaults.integer(forKey: sender.menuItem.objectId!)
        currentAmount+=1
        defaults.set(currentAmount,forKey:sender.menuItem.objectId!)
        defaults.synchronize()
        sender.itemAmountLabel.text = String(currentAmount)
        let price = Double(sender.menuItem.price)!
        let previousTotal = total
        let newTotal = previousTotal + price
        total = newTotal
        setTotalText()
    }
    
    func cartTableViewCellDidTapMinus(_ sender: CartTableViewCell) {
        let defaults = UserDefaults.standard
        var currentAmount = defaults.integer(forKey: sender.menuItem.objectId!)
        if( currentAmount <= 1) {
            return
        } else {
            currentAmount-=1
            defaults.set(currentAmount, forKey: sender.menuItem.objectId!)
            defaults.synchronize()
            let price = Double(sender.menuItem.price)!
            let previousTotal = total
            let newTotal = previousTotal - price
            total = newTotal
            setTotalText()
        }
        sender.itemAmountLabel.text = String(currentAmount)
    }
    
    func setTotalText() {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        let nsNumberSum = NSNumber.init(value:total)
        let sumString = "Order: " + currencyFormatter.string(from: nsNumberSum)!
        orderButton.setTitle(sumString, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        total = 0.0
        setTotalText()
        let defaults = UserDefaults.standard
        let cart = defaults.array(forKey: "cart") as! [String]
        let query:PFQuery =  PFQuery(className: "MenuItem")
        query.whereKey("objectId", containedIn: cart)
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if error == nil, let items = objects {
                self.resMenuItems = items as! [MenuItem]
                if( self.resMenuItems.count == 0 ) {
                    self.disableButton()
                } else {
                    self.enableButton()
                }
            } else {
                print("Error in restaurant query: \(error!)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 125
        // Do any additional setup after loading the view.
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        cell.menuItem = resMenuItems[indexPath.row]
        cell.delegate = self
        cell.selectionStyle = .none
        let price = Double(cell.menuItem.price)!
        let defaults = UserDefaults.standard
        let amount = defaults.integer(forKey: cell.menuItem.objectId!)
        cell.itemAmountLabel.text = String(amount)
        let subtotal = price * Double(amount)
        let previousTotal = total
        let newTotal = subtotal + previousTotal
        total = newTotal
        setTotalText()
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
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
       
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete" , handler: { (action:UITableViewRowAction!, indexPath: IndexPath!) -> Void in
            
            let deleteMenu = UIAlertController(title: nil, message: "Are you sure you want to delete this dish?", preferredStyle: .actionSheet)
            let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.default) { (action) in
                let defaults = UserDefaults.standard
                let cell = tableView.cellForRow(at: indexPath) as! CartTableViewCell
                let price = Double(cell.menuItem.price)!
                let amount = Double(defaults.integer(forKey: cell.menuItem.objectId!))
                let subtotal = price * amount
                self.total =  self.total - subtotal
                if(self.total <= 0 ){
                    self.total = 0.0
                }
                cell.itemAmountLabel.text = "1" //reset amount label
                self.setTotalText()
                self.delete = true
                self.resMenuItems.remove(at: indexPath.row)
                var cart: [String] = []
                for item in self.resMenuItems {
                    cart.append(item.objectId!)
                }
                defaults.removeObject(forKey: cell.menuItem.objectId!)
                defaults.set(cart, forKey: "cart")
                defaults.synchronize()
                self.delete = false
                self.tableView.deleteRows(at: [indexPath], with: .fade)
                if( self.resMenuItems.count == 0 ) {
                   self.disableButton()
                }
                
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            
            deleteMenu.addAction(deleteAction)
            deleteMenu.addAction(cancelAction)
            
            self.present(deleteMenu, animated: true, completion: nil)
            
            
        })
        deleteAction.backgroundColor = UIColor.red
        return [deleteAction]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapOrder(_ sender: UIButton) {
        self.performSegue(withIdentifier: "order", sender: nil)
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var cart: [OrderItem] = []
        
        let defaults = UserDefaults.standard
        let restaurantId = defaults.string(forKey: "currentRestaurant")
        
        for (index, menuItem) in resMenuItems.enumerated() {
            let indexPath = IndexPath(row: index, section: 0)
            let cell = tableView.cellForRow(at: indexPath) as! CartTableViewCell
            let amount = Int(defaults.integer(forKey: cell.menuItem.objectId!))
            let newOrderItem = OrderItem()
            newOrderItem.quantity = amount
            newOrderItem.addUniqueObject(menuItem, forKey: "menuItem")

            cart.append(newOrderItem)
        }

        let pickupViewController = segue.destination as! PickUpViewController
        pickupViewController.restaurantId = restaurantId
        pickupViewController.cart = cart
        pickupViewController.subtotal = total
        
     }
}
