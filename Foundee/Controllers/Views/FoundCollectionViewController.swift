//
//  FoundCollectionViewController.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 02/01/2025.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "FoundCell"

class FoundCollectionViewController: UICollectionViewController {
    
    private let realm = try! Realm()
    private var foundItems: Results<FoundItem>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-4, height: (view.frame.size.width/2)-4)
        collectionView!.collectionViewLayout = layout
        collectionView.frame = .zero
        collectionView.frame = view.bounds

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        loadFoundItems()
        
        // Register cell classes
        collectionView!.register(FoundItemCollectionViewCell.nib(), forCellWithReuseIdentifier: FoundItemCollectionViewCell.indentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return foundItems?.count ?? 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: FoundItemCollectionViewCell.indentifier, for: indexPath) as! FoundItemCollectionViewCell
    
        if let foundItem = foundItems?[indexPath.row] {
            customCell.foundItemImageView.image = UIImage(data: foundItem.image as Data)
            customCell.foundItemTitleLabel.text = foundItem.itemTitle
            customCell.foundItemLocationFoundLabel.text = foundItem.locationFound
        } else {
            customCell.foundItemTitleLabel.text = "No Found Items"
        }
        
        return customCell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FoundDetailsViewController") as! FoundDetailsViewController
        vc.item = foundItems?[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    
//MARK: - Model Manupulations Methods
        
    func loadFoundItems() {
        let predicate = NSPredicate(format: "isReturned == false")
        foundItems = realm.objects(FoundItem.self).sorted(by: \FoundItem.date, ascending: false).filter(predicate)
        collectionView.reloadData()
    }
}
