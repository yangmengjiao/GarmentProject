//
//  Garment.swift
//  GarmentList
//
//  Created by mengjiao on 2/17/21.
//
import Foundation
import RealmSwift

/// Garment
struct Garment: Identifiable {
    // The identifier
    let id: Int
    
    // Name of garment
    let name: String
    
    // Create date
    let createdDate: Date?
}


extension Garment {
    /// init method
    /// - Parameter garmentDB: the database garment object
    init(garmentDB: GarmentDB) {
        id = garmentDB.id
        name = garmentDB.name
        createdDate = garmentDB.createdDate
    }
}
