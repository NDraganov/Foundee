//
//  LostViewController.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 22/12/2024.
//

import UIKit
import RealmSwift

class LostTableViewController: UITableViewController {
    
    var lostItems: Results<Item>?
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadLostItems()
    }
    
//MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lostItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LostCell", for: indexPath)
        
        if let lostItem = lostItems?[indexPath.row] {
            cell.textLabel?.text = lostItem.item
        } else {
            cell.textLabel?.text = "No Lost Items"
        }
        
        return cell
    }
    
//MARK: - Model Manupulations Methods
    
    func loadLostItems() {
        lostItems = realm.objects(Item.self).sorted(by: \Item.date)
        tableView.reloadData()
    }


}
