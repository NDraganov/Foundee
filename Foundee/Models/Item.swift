//
//  ItemModel.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 22/12/2024.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var date: Date = Date()
    @objc dynamic var item: String = ""
    @objc dynamic var note: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var isReturned: Bool = false
    
}
