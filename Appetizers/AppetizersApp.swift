//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Omar on 25/12/2023.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    @StateObject private var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
