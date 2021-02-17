//
//  GarmentAddView.swift
//  GarmentProject
//
//  Created by mengjiao on 2/17/21.
//

import SwiftUI

struct GarmentFormView: View {
    @EnvironmentObject var viewModel: GarmentListViewModel
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var form: GarmentForm
    @State private var alertTitle = "Alert"
    @State private var alertMessage = "Please input first!"
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("Garment Name:")
                    .font(.callout)
                    .bold()
                TextField("", text: $form.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
            }.padding()
            .navigationBarTitle("Add", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(
                    "Save",
                    action: saveGarment))
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

// MARK: - Actions
extension GarmentFormView {
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func saveGarment() {
        if form.name.isEmpty {
            showingAlert = true
        } else {
            viewModel.create(name: form.name)
            dismiss()
        }
    }
}

#if DEBUG
struct GarmentFormView_Previews: PreviewProvider {
    static var previews: some View {
        GarmentFormView(form: GarmentForm())
    }
}
#endif
