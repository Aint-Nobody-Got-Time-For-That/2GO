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
    
    
    var restaurant: Restaurant?
    
    let resPhotos = ["Tropisueño", "La Taqueria", "Uno Dos Tacos", "Taqueria Castillo Mason", "Don Pisto's", "Papi's", "El Farolito", "La Boraco"]
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
            collectionView.dataSource = self
            collectionView.delegate = self
        //dynamically layout the rows for the cells
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 40
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerLine: CGFloat = 2
        let interItemSpacing = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let widthCell = collectionView.frame.width / cellsPerLine - interItemSpacing / cellsPerLine
        layout.itemSize = CGSize(width: widthCell, height: widthCell)
      
        
        resImage.image = UIImage(named: "food")!
        
        
         self.collectionView.reloadData()
    
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCollectionViewCell
        cell.resName.text = resPhotos[indexPath.item]
        cell.resPhoto.image = resImages[indexPath.item]
        
        return cell
    }
    
    //initiation the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        
        let indexPath = collectionView.indexPath(for: cell)!
        let viewController = segue.destination as! RestaurantViewController
        viewController.image = self.resImages[indexPath.row]
        viewController.name = self.resPhotos[indexPath.row]
    
    }
    
//    @IBAction func posterTap(_ sender: UITapGestureRecognizer) {
//        performSegue(withIdentifier: "resDetail", sender: nil)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
