//
//  DBManger.swift
//  GarmentProject
//
//  Created by mengjiao on 2/18/21.
//

import Foundation
import RealmSwift

/// Protocol For Data Base Manger
protocol DBManagerProtocol {
    
    associatedtype RealmObject: Object
    
    /// Save object
    /// - Parameter object: the object that be saved
    static func save(_ object: Object)
    
    /// Fetch results
    /// - Parameters:
    ///   - keyPath: sored method
    ///   - ascending: true means ascending , false means descending
    static func sortedObjects(by keyPath: String, ascending: Bool) -> Results<RealmObject>
    
    /// Update object
    /// - Parameter object: the object that be updated
    static func update(_ object: Object)
    
    /// Delete objects
    /// - Parameter object: the object that be deleted
    static func delete(_ object: Object)
}

class DBManger<T: Object>: DBManagerProtocol {
    
    typealias RealmObject = T
    
    // MARK: - Database CRUD
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
    
    static func sortedObjects(by keyPath: String, ascending: Bool) -> Results<T> {
        let realm = try! Realm()
        return realm.objects(T.self).sorted(byKeyPath: keyPath, ascending: ascending)
        
    }
 
    static func update(_ object: Object) {
        //TODO: to do in the future
    }
    
    static func delete(_ object: Object) {
        //TODO: to do in the future 
    }
    
   
    
}
