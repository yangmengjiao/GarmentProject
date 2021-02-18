//
//  GarmentForm.swift
//  GarmentProject
//
//  Created by mengjiao on 2/17/21.
//
import Foundation


/// Add Garment Submition form
class GarmentForm: ObservableObject {
    
    /// Garment name 
  @Published var name = ""

  init() { }

  init(_ garment: Garment) {
    name = garment.name
  }
}
