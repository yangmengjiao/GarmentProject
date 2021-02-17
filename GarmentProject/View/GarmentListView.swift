//
//  GarmentList.swift
//  GarmentList
//
//  Created by mengjiao on 2/17/21.
//

import SwiftUI

struct GarmentListView: View {
    @EnvironmentObject var viewModel: GarmentListViewModel
    var sortMethod = ["Alpha", "Creation Time"]
    @State private var selectedSortMethod = "Alpha"
    @State private var showAddSheet = false
    let garments: [Garment]
    
    var body: some View {
        VStack {
            Picker("Please choose a color", selection: $selectedSortMethod) {
                ForEach(sortMethod, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
    
            List {
                Section(header: Text("Garments")) {
                    if viewModel.garmentsByName.isEmpty {
                        Text("Add some garments to the list🥬")
                            .foregroundColor(.gray)
                    }
                    if selectedSortMethod == "Alpha" {
                        ForEach(viewModel.garmentsByName) { garment in
                            Text(garment.name)
                        }
                    } else {
                        ForEach(viewModel.garmentsByDate) { garment in
                            Text(garment.name)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("List", displayMode: .inline)
            .navigationBarItems(trailing:Button(action: addGarment) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showAddSheet, content: {
                GarmentFormView(form: GarmentForm())
                  .environmentObject(self.viewModel)
            })
        }
    }
    
    func addGarment() {
        self.showAddSheet.toggle()
    }
}
#if DEBUG
struct GarmentListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
