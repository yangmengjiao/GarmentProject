//
//  GarmentAddView.swift
//  GarmentProject
//
//  Created by mengjiao on 2/17/21.
//

import SwiftUI

/*
 The Form of add Garment  
 */
struct GarmentFormView: View {
    // all the constants
    struct Constant {
        struct Alert {
            static let title = "Alert"
            static let msg = "Please input first!"
            static let ok = "Ok"
        }
        
        static let textField = "Garment Name:"
        static let add = "Add"
        static let save = "Save"
        
    }
    
    @EnvironmentObject var viewModel: GarmentListViewModel
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var form: GarmentForm
    @State private var alertTitle = Constant.Alert.title
    @State private var alertMessage = Constant.Alert.msg
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                Text(Constant.textField)
                    .font(.callout)
                    .bold()
                TextField("", text: $form.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
            }.padding()
            .navigationBarTitle(Constant.add, displayMode: .inline)
            .navigationBarItems(
                trailing: Button(
                    Constant.save,
                    action: saveGarment))
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text(Constant.Alert.ok)))
            }
        }
    }
}

// MARK: - Actions
extension GarmentFormView {
   private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
   private func saveGarment() {
        if form.name.isEmpty {
            showingAlert = true
        } else {
            viewModel.create(name: form.name)
            dismiss()
        }
    }
}

// MARK: - Previews
#if DEBUG
struct GarmentFormView_Previews: PreviewProvider {
    static var previews: some View {
        GarmentFormView(form: GarmentForm())
    }
}
#endif
