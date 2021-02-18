//
//  GarmentAddView.swift
//  GarmentProject
//
//  Created by mengjiao on 2/17/21.
//

import SwiftUI

/// The Form of add Garment
struct GarmentFormView: View {
    
    /// All the constant
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
    
    /// model view
    @EnvironmentObject var viewModel: GarmentListViewModel
    
    /// use it to dismiss view
    @Environment(\.presentationMode) var presentationMode
    
    /// Form of Garment
    @ObservedObject var form: GarmentForm
    
    /// title for alert
    @State private var alertTitle = Constant.Alert.title
    
    /// message for alert
    @State private var alertMessage = Constant.Alert.msg
    
    /// true measn show alert,  false means hide alert
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
    
    /// dis miss garment form view
   private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    
    /// save garment action
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
