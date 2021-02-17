//
//  GarmentForm.swift
//  GarmentProject
//
//  Created by mengjiao on 2/17/21.
//
import Foundation

class GarmentForm: ObservableObject {
  @Published var name = ""
    
  var garmentId: Int?

  var updating: Bool {
    garmentId != nil
  }

  init() { }

  init(_ garment: Garment) {
    name = garment.name
  }
}
