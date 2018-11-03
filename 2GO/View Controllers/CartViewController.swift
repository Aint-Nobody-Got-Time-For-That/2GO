//
//  CartViewController.swift
//  2GO
//
//  Created by Pat Khai on 10/24/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit
import Parse

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var cartMenu: Cart!
    var delete = false
    
    var resMenuItems: [MenuItem] = [] {
        didSet {
            if(!delete) {
                tableView.reloadData()
            }
        }
    }
    
    var index = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
    
        if defaults.array(forKey: "cart") != nil {
            let cart = defaults.array(forKey: "cart") as! [String]
            let query:PFQuery =  PFQuery(className: "MenuItem")
            query.whereKey("objectId", containedIn: cart)
            query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
                if error == nil, let items = objects {
                    self.resMenuItems = items as! [MenuItem]
                } else {
                    print("Error in restaurant query: \(error!)")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 121
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        cell.menuItem = resMenuItems[indexPath.row]
        return cell
    }
    //
    //    internal func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    //        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
    //            // TODO: Delete todo
    //            let todo = self.restaurant.menuItems[indexPath.row]
    //            self.restaurant.menuItems.delete(todo)
    //            do {
    //                try self.resultsController.managedObjectContext.save()
    //                completion(true)
    //            } catch {
    //                print("delete failed: \(error)")
    //                completion(false)
    //            }
    //        }
    //        action.image = #imageLiteral(resourceName: "trash")
    //        action.backgroundColor = .red
    //
    //        return UISwipeActionsConfiguration(actions: [action])
    //    }
    //
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
       
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete" , handler: { (action:UITableViewRowAction!, indexPath: IndexPath!) -> Void in
            
            let deleteMenu = UIAlertController(title: nil, message: "Are you sure you want to delete this menu?", preferredStyle: .actionSheet)
            let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.default) { (action) in
                self.delete = true
                let defaults = UserDefaults.standard
                self.resMenuItems.remove(at: indexPath.row)
                
                var cart: [String] = []
                for item in self.resMenuItems {
                    cart.append(item.objectId!)
                }
                defaults.set(cart, forKey: "cart")
                defaults.synchronize()
                self.delete = false
                self.tableView.deleteRows(at: [indexPath], with: .fade)
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
    
    @IBAction func didTapCheckout(_ sender: UIButton) {
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
