//
//  DetailsViewController.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 29/12/2024.
//

import UIKit
import RealmSwift

class DetailsViewController: UIViewController {

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

        itemTitle.text = item?.item
        itemNote.text = item?.note
        date.text = formattedDate
        founderName.text = item?.name
        founderPhone.text = item?.phone
        founderEmail.text = item?.email
    }

    @IBAction func returnSwitchPressed(_ sender: UISwitch) {
        if sender.isOn {
            do {
                try realm.write {
                    item?.isReturned = true
                }
            } catch {
                print("Error changing the return state \(error)")
            }
        }
    }
}
