//
//  GarmentList.swift
//  GarmentList
//
//  Created by mengjiao on 2/17/21.
//

import SwiftUI

/*
 The Lists of Garment
 */
struct GarmentListView: View {
    // all the constant
    struct Constant {
        static let alpha = "Alpha"
        static let createdTime = "Creation Time"
        static let pickerMsg = "Please choose sort method"
        static let headerOfList = "Garments"
        static let noGarmentMsg = "Add some garments to the list🥬"
        static let title = "List"
        static let addButtonSystemName = "plus"
    }
    
    // model view
    @EnvironmentObject var viewModel: GarmentListViewModel
    
    var sortMethod = [Constant.alpha, Constant.createdTime]
    @State private var selectedSortMethod = Constant.alpha
    @State private var showAddSheet = false
    
    var body: some View {
        VStack {
            // Sort method picker
            Picker(Constant.pickerMsg, selection: $selectedSortMethod) {
                ForEach(sortMethod, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
    
            // the lists
            List {
                Section(header: Text(Constant.headerOfList)) {
                    if viewModel.garmentsByName.isEmpty {
                        Text(Constant.noGarmentMsg)
                            .foregroundColor(.gray)
                    }
                    if selectedSortMethod == Constant.alpha {
                        // show list by alphabetical order
                        ForEach(viewModel.garmentsByName) { garment in
                            Text(garment.name)
                        }
                    } else {
                        // show list by created date order
                        ForEach(viewModel.garmentsByDate) { garment in
                            Text(garment.name)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Constant.title, displayMode: .inline)
            .navigationBarItems(trailing:Button(action: addGarment) {
                Image(systemName: Constant.addButtonSystemName)
            })
            //show add form
            .sheet(isPresented: $showAddSheet, content: {
                GarmentFormView(form: GarmentForm())
                  .environmentObject(self.viewModel)
            })
        }
    }
    
    // MARK: - Actions
   private func addGarment() {
        self.showAddSheet.toggle()
    }
}


// MARK: - Previews
#if DEBUG
struct GarmentListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
