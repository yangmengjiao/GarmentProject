//
//  GarmentListViewModel.swift
//  GarmentListViewModel
//
//  Created by mengjiao on 2/17/21.
//

import Foundation
import RealmSwift

final class GarmentListViewModel: ObservableObject {
    private var garmentResults: Results<GarmentDB>!
    private var realm: Realm
    init(realm: Realm) {
        self.realm = realm
    }
    
    var garmentsByDate: [Garment] {
        sorted(by: "createdDate", false)
        return garmentResults.map(Garment.init)
    }
    
    var garmentsByName: [Garment] {
        sorted(by: "name", true)
        return garmentResults.map(Garment.init)
    }

    func sorted(by key: String, _ ascending: Bool) {
        garmentResults = realm.objects(GarmentDB.self).sorted(byKeyPath: key, ascending: ascending)
    }
    
}

// MARK: - CRUD Actions
extension GarmentListViewModel {
    func create(name: String) {
        objectWillChange.send()
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
    
}
