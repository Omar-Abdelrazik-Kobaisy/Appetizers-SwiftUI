//
//  Alert.swift
//  Appetizers
//
//  Created by Omar on 27/12/2023.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext{
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("error message friendly to user"),
                                       dismissButton: .default(Text("Ok")))
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                       message: Text("error message friendly to user"),
                                       dismissButton: .default(Text("Ok")))
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                       message: Text("error message friendly to user"),
                                       dismissButton: .default(Text("Ok")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                       message: Text("error message friendly to user"),
                                       dismissButton: .default(Text("Ok")))
}
