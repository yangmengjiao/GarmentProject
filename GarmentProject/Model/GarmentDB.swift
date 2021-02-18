//
//  GarmentList.swift
//  GarmentList
//
//  Created by mengjiao on 2/17/21.
//

import Foundation
import RealmSwift

/*
 The Database Layer
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
        do {
            let realm = try Realm()
            
            let garmentDB = GarmentDB()
            garmentDB.id = UUID().hashValue
            garmentDB.name = name
            garmentDB.createdDate = Date()
            try realm.write {
                realm.add(garmentDB)
            }
            
        } catch let error {
            // Handle error
            print(error.localizedDescription)
        }
    }
    
    // sorted by date
    class func newestFirst() -> Results<GarmentDB> {
        let realm = try! Realm()
        return realm.objects(GarmentDB.self).sorted(byKeyPath: Constant.KeyPath.createdDate, ascending: false)
    }
    
    // sorted by name
    class func alphaSequence() -> Results<GarmentDB> {
        let realm = try! Realm()
        return realm.objects(GarmentDB.self).sorted(byKeyPath: Constant.KeyPath.name, ascending: true)
    }

}
