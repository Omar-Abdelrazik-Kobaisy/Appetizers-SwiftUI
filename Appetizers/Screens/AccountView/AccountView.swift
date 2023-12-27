//
//  AccountView.swift
//  Appetizers
//
//  Created by Omar on 25/12/2023.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationStack{
            Text("Account View")
                .navigationTitle("Accounts")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
