//
//  NewItemViewController.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 22/12/2024.
//

import UIKit
import RealmSwift

class NewLostItemViewController: UIViewController {

    @IBOutlet weak var dateAndTime: UIDatePicker!
    @IBOutlet weak var itemDescriptionTxt: UITextField!
    @IBOutlet weak var notesItemTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var phoneNumberTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    
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
       
        let newItem = LostItem()
        newItem.date = dateAndTime.date
        newItem.item = itemDescriptionTxt.text!
        newItem.note = notesItemTxt.text!
        newItem.name = nameTxt.text!
        newItem.phone = phoneNumberTxt.text!
        newItem.email = emailTxt.text!
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
    
    @IBAction func cancelNewItemPressed(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension NewLostItemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
