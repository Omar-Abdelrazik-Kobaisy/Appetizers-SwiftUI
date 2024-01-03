//
//  ContentView.swift
//  Appetizers
//
//  Created by Omar on 25/12/2023.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Account")
                }
            OrderView()
                .tabItem { Label("Order", systemImage: "bag.circle.fill") }
                .badge(order.OrderItems.count)
        }
        .tint(.brandPrimary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
            .environmentObject(Order())
    }
}
