//
//  AccountView.swift
//  Appetizers
//
//  Created by Omar on 25/12/2023.
//

import SwiftUI

struct AccountView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthday = Date()
    @State private var extraNapKins = false
    @State private var frequentRefill = false
    
    var body: some View {
        NavigationStack{
            Form{
                Section {
                    TextField("FirstName",
                              text: $firstName)
                    TextField("LastName",
                              text: $lastName)
                    TextField("Email",
                              text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled(true)
                    
                    DatePicker("Birthday",
                               selection: $birthday,
                               displayedComponents: .date)
                    
                    Button {
                        print("PersonalInfoSaved ->"+firstName+", "+lastName+", "+email)
                    } label: {
                        Text("Save Changes")
                    }

                } header: {
                    Text("Personal Info")
                }
                Section {
                    Toggle("Extra Napkins",
                           isOn: $extraNapKins)
                    Toggle("Frequent Refill",
                           isOn: $frequentRefill)
                } header: {
                    Text("Requests")
                }
                .tint(.brandPrimary)
            }
                .navigationTitle("Accounts")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
