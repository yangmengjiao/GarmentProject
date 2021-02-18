//
//  GarmentForm.swift
//  GarmentProject
//
//  Created by mengjiao on 2/17/21.
//
import Foundation

/*
 Add Garment Submition form
 */
class GarmentForm: ObservableObject {
  @Published var name = ""
    
  var garmentId: Int?

  init() { }

  init(_ garment: Garment) {
    name = garment.name
  }
}
