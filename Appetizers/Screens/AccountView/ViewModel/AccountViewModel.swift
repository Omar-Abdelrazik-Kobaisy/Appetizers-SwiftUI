//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Omar on 31/12/2023.
//

import SwiftUI

class AccountViewModel: ObservableObject{
    
    @AppStorage(String(describing: User.self)) private var userData: Data?
    
    @Published var user = User()
    @Published var alert: AlertItem?

    var isValidForm: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alert = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else{
            alert = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func SaveChanges(){
        guard isValidForm else {
            return
        }
        guard let userData = user.convert(object: user) else{
            alert = AlertContext.invalidData
            return
        }
        self.userData = userData
        alert = AlertContext.savedSuccessfully
    }
    
    
    
}
