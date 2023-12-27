//
//  OrderView.swift
//  Appetizers
//
//  Created by Omar on 25/12/2023.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationStack{
            Text("Order View")
                .navigationTitle("Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
