//
//  NewItemViewController.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 22/12/2024.
//

import UIKit
import RealmSwift

class NewItemViewController: UIViewController {

    @IBOutlet weak var dateAndTime: UIDatePicker!
    @IBOutlet weak var itemDescriptionTxt: UITextField!
    @IBOutlet weak var notesItemTxt: UITextField!
    @IBOutlet weak var founderNameTxt: UITextField!
    @IBOutlet weak var phoneNumberTxt: UITextField!
    @IBOutlet weak var founderEmailTxt: UITextField!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
       
        let newItem = Item()
        newItem.date = dateAndTime.date
        newItem.item = itemDescriptionTxt.text!
        newItem.note = notesItemTxt.text!
        newItem.name = founderNameTxt.text!
        newItem.phone = phoneNumberTxt.text!
        newItem.email = founderEmailTxt.text!
        
        do {
            try realm.write {
                realm.add(newItem)
            }
        } catch {
            print("Error adding item: \(error)")
        }
        
    }
    
}
