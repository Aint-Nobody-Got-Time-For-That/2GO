//
//  HomeViewController.swift
//  2GO
//
//  Created by Pat Khai on 10/17/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchButtom: UISearchBar!
    @IBOutlet weak var resImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        //dynamically layout the rows for the cells
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerLine: CGFloat = 2
        let interItemSpacing = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let widthCell = collectionView.frame.width / cellsPerLine - interItemSpacing / cellsPerLine
        layout.itemSize = CGSize(width: widthCell - 4, height: widthCell + 6)
        
        resImage.image = UIImage(named: "food")! //Home view Image
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FakeData.restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCollectionViewCell
        cell.restaurant = FakeData.restaurants[indexPath.row]
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        cell.layer.cornerRadius = 5
        
        return cell
    }
    
    //initiation the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        
        let indexPath = collectionView.indexPath(for: cell)!
        let viewController = segue.destination as! RestaurantViewController
        viewController.restaurant = FakeData.restaurants[indexPath.item]
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
