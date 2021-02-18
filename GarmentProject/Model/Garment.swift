//
//  Garment.swift
//  GarmentList
//
//  Created by mengjiao on 2/17/21.
//
import Foundation
import RealmSwift

/*
 Represent Garment
 */
struct Garment: Identifiable, RealmCollectionValue {
  // the unique id
  let id: Int
    
  // Name of garment
  let name: String
    
  // The time of creation of this Garment
  let createdDate: Date?
}

// MARK: Convenience init
extension Garment {
  init(garmentDB: GarmentDB) {
    id = garmentDB.id
    name = garmentDB.name
    createdDate = garmentDB.createdDate
  }
}
