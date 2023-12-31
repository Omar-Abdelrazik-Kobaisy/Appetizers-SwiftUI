//
//  AccountView.swift
//  Appetizers
//
//  Created by Omar on 25/12/2023.
//

import SwiftUI

struct AccountView: View {
    
//    @State private var firstName = ""
//    @State private var lastName = ""
//    @State private var email = ""
//    @State private var birthday = Date()
//    @State private var extraNapKins = false
//    @State private var frequentRefill = false
    @StateObject var vm = AccountViewModel()
    
    var body: some View {
        NavigationStack{
            Form{
                Section {
                    TextField("FirstName",
                              text: $vm.user.firstName)
                    TextField("LastName",
                              text: $vm.user.lastName)
                    TextField("Email",
                              text: $vm.user.email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled(true)
                    
                    DatePicker("Birthday",
                               selection: $vm.user.birthday,
                               displayedComponents: .date)
                    
                    Button {
                        vm.SaveChanges()
                    } label: {
                        Text("Save Changes")
                    }

                } header: {
                    Text("Personal Info")
                }
                Section {
                    Toggle("Extra Napkins",
                           isOn: $vm.user.extraNapKins)
                    Toggle("Frequent Refill",
                           isOn: $vm.user.frequentRefill)
                } header: {
                    Text("Requests")
                }
                .tint(.brandPrimary)
            }
                .navigationTitle("Accounts")
        }
        .alert(item: $vm.alert) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}