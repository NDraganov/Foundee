//
//  FoundViewController.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 22/12/2024.
//

import UIKit
import RealmSwift

class FoundViewController: UITableViewController {
    
    private let realm = try! Realm()
    private var foundItems: Results<FoundItem>?

    override func viewDidLoad() {
        super.viewDidLoad()

        loadFoundItems()
        
        // Register the custom table view cell
        tableView.register(LostItemTableViewCell.nib(), forCellReuseIdentifier: LostItemTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
//MARK: - TableView Delegate Methods
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "LostDetailsViewController") as! LostDetailsViewController
//        vc.item = foundItems?[indexPath.row]
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
//MARK: - TableView Datasource Methods
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return foundItems?.count ?? 1
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let customCell = tableView.dequeueReusableCell(withIdentifier: LostItemTableViewCell.identifier, for: indexPath) as! LostItemTableViewCell
            
            if let foundItem = foundItems?[indexPath.row] {
                customCell.lostItemLabel?.text = foundItem.note
                customCell.lostItemNameLabel?.text = foundItem.foundBy
                customCell.lostItemNoteLabel?.text = foundItem.note
                customCell.lostItemImageView?.image = UIImage(data: foundItem.image as Data)
            } else {
                customCell.lostItemLabel?.text = "No Found Items"
            }
            
            return customCell
        }
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 75
        }
    
//MARK: - Model Manupulations Methods
    
    func loadFoundItems() {
        let predicate = NSPredicate(format: "isReturned == true")
        foundItems = realm.objects(FoundItem.self).filter(predicate)
        tableView.reloadData()
    }

}
