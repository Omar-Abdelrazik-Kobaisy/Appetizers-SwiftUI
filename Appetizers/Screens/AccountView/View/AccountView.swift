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
    @FocusState var focusTextField: FormTextField?
    
    enum FormTextField{
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section {
                    TextField("FirstName",
                              text: $vm.user.firstName)
                    .focused($focusTextField, equals: .firstName)
                    .onSubmit {
                        focusTextField = .lastName
                    }.submitLabel(.next)
                    TextField("LastName",
                              text: $vm.user.lastName)
                    .focused($focusTextField, equals: .lastName)
                    .onSubmit {
                        focusTextField = .email
                    }.submitLabel(.next)
                    TextField("Email",
                              text: $vm.user.email)
                    .focused($focusTextField, equals: .email)
                    .onSubmit {
                        focusTextField = nil
                    }.submitLabel(.continue)
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
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard, content: {
                        Button {
                            focusTextField = nil
                        } label: {
                            Text("Dismiss")
                        }
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .padding(.trailing)

                    })
                }
        }
        .onAppear(perform: {
            vm.retrieveUser()
        })
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
