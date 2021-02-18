//
//  GarmentList.swift
//  GarmentList
//
//  Created by mengjiao on 2/17/21.
//

import Foundation
import RealmSwift

/*
 The DataBase object of Garment
 */
class GarmentDB: Object {
    struct Constant {
        static let id = "id"
        struct KeyPath {
            static let createdDate = "createdDate"
            static let name = "name"
        }
    }
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var createdDate: Date?
    
    override static func primaryKey() -> String? {
        Constant.id
    }
    
    // MARK: - Database CRUD
    
    // save to DB
    class func save(_ name: String) {
            let garmentDB = GarmentDB()
            garmentDB.id = UUID().hashValue
            garmentDB.name = name
            garmentDB.createdDate = Date()
        DBManger<GarmentDB>.save(garmentDB)
    }
    
    // sorted by date
    class func newestFirst() -> Results<GarmentDB> {
        return DBManger<GarmentDB>.sortedObjects(by: Constant.KeyPath.createdDate, ascending: false)
    }
    
    // sorted by name
    class func alphaSequence() -> Results<GarmentDB> {
        return DBManger<GarmentDB>.sortedObjects(by: Constant.KeyPath.name, ascending: true)
    }

}
