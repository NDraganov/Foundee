//
//  DetailsViewController.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 29/12/2024.
//

import UIKit
import RealmSwift

class DetailsViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemNote: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var founderName: UILabel!
    @IBOutlet weak var founderPhone: UILabel!
    @IBOutlet weak var founderEmail: UILabel!
    @IBOutlet weak var returnSwitch: UISwitch!
    
    let realm = try! Realm()
    var item: Item?
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        let formattedDate = dateFormatter.string(from: item!.date)

        itemImage.image = UIImage(data: item!.image as Data)
        itemTitle.text = item?.item
        itemNote.text = item?.note
        date.text = formattedDate
        founderName.text = item?.name
        founderPhone.text = item?.phone
        founderEmail.text = item?.email
        
        if item?.isReturned == true {
            returnSwitch.isOn = true
        }
    }

    @IBAction func returnSwitchPressed(_ sender: UISwitch) {
       
        let alert = UIAlertController(title: "Confirmation", message: "Confirm that this item has been returned", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            sender.isOn = false
        }))
        
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { action in
            if sender.isOn == true {
                do {
                    try self.realm.write {
                        self.item?.isReturned = true
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                } catch {
                    print("Error changing the return state \(error)")
                }
            }
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
}
