//
//  GarmentListViewModel.swift
//  GarmentListViewModel
//
//  Created by mengjiao on 2/17/21.
//

import Foundation
import RealmSwift

final class GarmentListViewModel: ObservableObject {
    
    // Garments that sorted by date
    var garmentsByDate: [Garment] {
        return GarmentDB.newestFirst().map(Garment.init)
    }
    
    // Garments that sorted by name
    var garmentsByName: [Garment] {
        return GarmentDB.alphaSequence().map(Garment.init)
    }
}

// MARK: - CRUD Actions
extension GarmentListViewModel {
    func create(name: String) {
        objectWillChange.send()
        GarmentDB.save(name)
    }
}
