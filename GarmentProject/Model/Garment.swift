//
//  Garment.swift
//  GarmentList
//
//  Created by mengjiao on 2/17/21.
//
import Foundation

struct Garment: Identifiable {
  let id: Int
  let name: String
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
