//
//  HomeViewController.swift
//  2GO
//
//  Created by Pat Khai on 10/17/18.
//  Copyright © 2018 Pat Khai. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var filteredRestaurants: [Restaurant] = []
    var restaurants: [Restaurant] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredRestaurants = searchText.isEmpty ? restaurants : restaurants.filter{( $0["name"] as! String).range( of:searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        self.collectionView.reloadData()
    }
    
    var restaurant: Restaurant!
    var imageArray = [UIImage]()
    
    fileprivate func collectionLayout() {
        //dynamically layout the rows for the cells
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerLine: CGFloat = 1
        let interItemSpacing = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let widthCell = collectionView.frame.width / cellsPerLine - interItemSpacing / cellsPerLine
        layout.itemSize = CGSize(width: widthCell - 29, height: widthCell - 179)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredRestaurants.count
    }
    
    fileprivate func layOut(_ cell: PosterCollectionViewCell) {
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        cell.layer.cornerRadius = 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCollectionViewCell
        cell.restaurant = filteredRestaurants[indexPath.row]
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
    
    func searchBarEdit() {
        searchBar.layer.shadowRadius = 2.0
        searchBar.layer.shadowOpacity = 1.0
        searchBar.layer.shadowColor = UIColor.gray.cgColor
        searchBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
    }
    
    
    //initiation the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let viewController = segue.destination as! RestaurantViewController
        viewController.restaurant = restaurants[indexPath.item]
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let restaurantQuery = PFQuery(className: "Restaurant")
        restaurantQuery.findObjectsInBackground { (objects: [PFObject]!, error: Error?) in
            if error == nil, let restaurants = objects {
                self.restaurants = restaurants as! [Restaurant]
                self.filteredRestaurants = restaurants as! [Restaurant]
            } else {
                print("Error in restaurant query in HomeViewController view did Appear: \(error!)")
            }
        }
    }
    
    @objc func imageSwipper() {
        imageArray = [#imageLiteral(resourceName: "avocado-toast") ,#imageLiteral(resourceName: "lexie-barnhorn-583894-unsplash") ,#imageLiteral(resourceName: "acai-bowl") , #imageLiteral(resourceName: "jelleke-vanooteghem-400034-unsplash"),#imageLiteral(resourceName: "taco5") ]
        for i in 0..<imageArray.count {
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleAspectFill
            let xPos = self.scrollView.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
        
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
            scrollView.addSubview(imageView)
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
        collectionLayout()
        
        searchBar.delegate = self
        searchBarEdit()
        
        //swipping image view
        scrollView.frame.width == view.frame.width
        imageSwipper()
        
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        // Do any additional setup after loading the view.
    }

}
