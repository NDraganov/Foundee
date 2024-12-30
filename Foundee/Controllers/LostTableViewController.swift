//
//  LostViewController.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 22/12/2024.
//

import UIKit
import RealmSwift

class LostTableViewController: UITableViewController {
    
    private var lostItems: Results<Item>?
    private let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadLostItems()
        
        // Register the custom table view cell
        tableView.register(LostItemTableViewCell.nib(), forCellReuseIdentifier: LostItemTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
//MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.item = lostItems?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lostItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: LostItemTableViewCell.identifier, for: indexPath) as! LostItemTableViewCell
        
        if let lostItem = lostItems?[indexPath.row] {
            customCell.lostItemLabel?.text = lostItem.item
            customCell.lostItemNameLabel?.text = lostItem.name
            customCell.lostItemNoteLabel?.text = lostItem.note
            customCell.lostItemImageView?.image = UIImage(data: lostItem.image as Data)
        } else {
            customCell.lostItemLabel?.text = "No Lost Items"
        }
        
        return customCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
//MARK: - Model Manupulations Methods
    
    func loadLostItems() {
        let predicate = NSPredicate(format: "isReturned == false")
        lostItems = realm.objects(Item.self).sorted(by: \Item.date, ascending: false).filter(predicate)
        tableView.reloadData()
    }


}
