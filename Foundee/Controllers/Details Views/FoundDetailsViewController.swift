//
//  FoundDetailsViewController.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 10/01/2025.
//

import UIKit
import RealmSwift

class FoundDetailsViewController: UIViewController {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var foundBy: UILabel!
    @IBOutlet weak var locationFound: UILabel!
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var returnSwitch: UISwitch!
    
    private let realm = try! Realm()
    var item: FoundItem?
    private let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        let formattedDate = dateFormatter.string(from: item!.date)
        
        itemImage.image = UIImage(data: item!.image as Data)
        itemTitle.text = item?.itemTitle
        date.text = formattedDate
        foundBy.text = item?.foundBy
        locationFound.text = item?.locationFound
        currentLocation.text = item?.currentLocation
        
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
