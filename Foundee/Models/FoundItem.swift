//
//  FoundItem.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 02/01/2025.
//

import Foundation
import RealmSwift

class FoundItem: Object {
    @objc dynamic var date: Date = Date()
    @objc dynamic var itemTitle: String = ""
    @objc dynamic var foundBy: String = ""
    @objc dynamic var locationFound: String = ""
    @objc dynamic var currentLocation: String = ""
    @objc dynamic var image: NSData = NSData()
    @objc dynamic var isReturned: Bool = false
}
