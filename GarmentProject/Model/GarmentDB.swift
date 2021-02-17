//
//  GarmentList.swift
//  GarmentList
//
//  Created by mengjiao on 2/17/21.
//

import Foundation
import RealmSwift

class GarmentDB: Object {
  @objc dynamic var id = 0
  @objc dynamic var name = ""
  @objc dynamic var createdDate: Date?

  override static func primaryKey() -> String? {
    "id"
  }
}
