//
//  ContentView.swift
//  GarmentList
//
//  Created by mengjiao on 2/17/21.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @EnvironmentObject var viewModel: GarmentListViewModel
    var body: some View {
        NavigationView {
            GarmentListView(garments: viewModel.garmentsByName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
