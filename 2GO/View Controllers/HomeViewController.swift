//
//  HomeViewController.swift
//  2GO
//
//  Created by Pat Khai on 10/17/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var restaurant: Restaurant!
    
    var searchController = UISearchController()
    
    
    fileprivate func collectionLayout() {
        //dynamically layout the rows for the cells
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerLine: CGFloat = 1
        let interItemSpacing = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let widthCell = collectionView.frame.width / cellsPerLine - interItemSpacing / cellsPerLine
        layout.itemSize = CGSize(width: widthCell - 26, height: widthCell - 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FakeData.restaurants.count
    }
    
    fileprivate func layOut(_ cell: PosterCollectionViewCell) {
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        cell.layer.cornerRadius = 5
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCollectionViewCell
        cell.restaurant = FakeData.restaurants[indexPath.row]
        layOut(cell)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 20, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
        
    }
    
    
    //initiation the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let viewController = segue.destination as! RestaurantViewController
        viewController.restaurant = FakeData.restaurants[indexPath.item]
 
    }
    //
    //    func imageWith(name: String?) -> UIImage? {
    //        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    //        let nameLabel = UILabel(frame: frame)
    //        nameLabel.textAlignment = .center
    //        nameLabel.backgroundColor =
    //        nameLabel.textColor = .white
    //        nameLabel.font = UIFont.boldSystemFont(ofSize: 40)
    //        nameLabel.text = name
    //        UIGraphicsBeginImageContext(frame.size)
    //        if let currentContext = UIGraphicsGetCurrentContext() {
    //            nameLabel.layer.render(in: currentContext)
    //            let nameImage = UIGraphicsGetImageFromCurrentImageContext()
    //            return nameImage
    //        }
    //        return nil
    //    }
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionLayout()
        searchBar.delegate = self
        imageView.image =  UIImage(named: "food")//Home view Image
        
        ////        collectionView.contentOffset = CGPoint(x:0, y: -40 )
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    //
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        let y = 365 - (scrollView.contentOffset.y + 300)
    //        let height = min(max(y, 60), 400)
    //        imageView.frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: height)
    //          self.navigationController?.hidesBarsOnSwipe = false
    //
    //
    //    }
    
    
    
}
