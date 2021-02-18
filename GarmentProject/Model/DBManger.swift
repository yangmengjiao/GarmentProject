//
//  DBManger.swift
//  GarmentProject
//
//  Created by mengjiao on 2/18/21.
//

import Foundation
import RealmSwift

protocol DBManagerProtocol {
    // save object to databse
    static func save(_ object: Object)
    
    // update object to databse
    static func update(_ object: Object)
    
    // delete object to databse
    static func delete(_ object: Object)
}

class DBManger<T: Object>: DBManagerProtocol {
 

    // MARK: - Database CRUD
    
    // save
    static func save(_ object: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(object)
            }
            
        } catch let error {
            // Handle error
            print(error.localizedDescription)
        }
    }
    
    // read
    static func sortedObjects(by keyPath: String, ascending: Bool) -> Results<T> {
        let realm = try! Realm()
        return realm.objects(T.self).sorted(byKeyPath: keyPath, ascending: ascending)
        
    }
    
    static func update(_ object: Object) {
        //todo in the future
    }
    
    static func delete(_ object: Object) {
        //todo in the future
    }
    
   
    
}
