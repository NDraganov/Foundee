//
//  ItemModel.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 22/12/2024.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var date: Date
    @objc dynamic var item: String
    @objc dynamic var note: String
    @objc dynamic var name: String
    @objc dynamic var phone: String
    @objc dynamic var email: String
    @objc dynamic var isReturned: Bool
    
    init(date: Date, item: String, note: String, name: String, phone: String, email: String, isReturned: Bool) {
        self.date = date
        self.item = item
        self.note = note
        self.name = name
        self.phone = phone
        self.email = email
        self.isReturned = isReturned
    }
}
