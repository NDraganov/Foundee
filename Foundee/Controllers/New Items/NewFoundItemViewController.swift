//
//  NewFoundItemViewController.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 02/01/2025.
//

import UIKit
import RealmSwift

class NewFoundItemViewController: UIViewController {

    @IBOutlet weak var dateAndTime: UIDatePicker!
    @IBOutlet weak var itemDescriptionTxt: UITextField!
    @IBOutlet weak var founderName: UITextField!
    @IBOutlet weak var currentLocation: UITextField!
    @IBOutlet weak var locationFound: UITextField!
    
    private let realm = try! Realm()
    private let picker = UIImagePickerController()
    private var pickedImage: NSData = NSData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func uploadImagePressed(_ sender: UIButton) {
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
       
        let newItem = FoundItem()
        newItem.date = dateAndTime.date
        newItem.itemTitle = itemDescriptionTxt.text!
        newItem.foundBy = founderName.text!
        newItem.currentLocation = currentLocation.text!
        newItem.locationFound = locationFound.text!
        newItem.image = pickedImage
        
        do {
            try realm.write {
                realm.add(newItem)
            }
            navigationController?.popViewController(animated: true)  // Redirect to the Lost Table View
        } catch {
            print("Error adding item: \(error)")
        }
        
    }

}

extension NewFoundItemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            let imageData = NSData(data: image.pngData()!)
            pickedImage = imageData
        }
        
        picker.dismiss(animated: true , completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true , completion: nil)
    }
}
