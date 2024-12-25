//
//  LostViewController.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 22/12/2024.
//

import UIKit
import RealmSwift

class LostTableViewController: UITableViewController {
    
//    @IBOutlet weak var table: UITableView!
    
    private var lostItems: Results<Item>?
    private let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLostItems()
        
        tableView.register(LostItemTableViewCell.nib(), forCellReuseIdentifier: LostItemTableViewCell.identifier)
        
        
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
        } else {
            customCell.lostItemLabel?.text = "No Lost Items"
        }
        
        return customCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
//    override func tableView(_tableView: UITableView, heightForRowAtindexPath: IndexPath) -> CGFloat {
//      return 70
//    }
    
//MARK: - Model Manupulations Methods
    
    func loadLostItems() {
        lostItems = realm.objects(Item.self).sorted(by: \Item.date)
        tableView.reloadData()
    }


}
