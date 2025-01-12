//
//  FoundDetailsViewController.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 10/01/2025.
//

import UIKit

class FoundDetailsViewController: UIViewController {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var foundBy: UILabel!
    @IBOutlet weak var locationFound: UILabel!
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var returnSwitch: UISwitch!
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
