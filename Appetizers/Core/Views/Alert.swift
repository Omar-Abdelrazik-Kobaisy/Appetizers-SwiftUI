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
    static let invalidData = AlertItem(title: Text("Server Error -> invalid Data"),
                                       message: Text("error message friendly to user"),
                                       dismissButton: .default(Text("Ok")))
    static let invalidResponse = AlertItem(title: Text("Server Error -> invalid Response"),
                                       message: Text("error message friendly to user"),
                                       dismissButton: .default(Text("Ok")))
    static let invalidURL = AlertItem(title: Text("Server Error -> invalid URL"),
                                       message: Text("error message friendly to user"),
                                       dismissButton: .default(Text("Ok")))
    static let unableToComplete = AlertItem(title: Text("Server Error -> unable To Complete"),
                                       message: Text("error message friendly to user"),
                                       dismissButton: .default(Text("Ok")))
    static let invalidForm = AlertItem(title: Text("invalid Form"),
                                       message: Text("error message friendly to user"),
                                       dismissButton: .default(Text("Ok")))
    static let invalidEmail = AlertItem(title: Text("invalid Email"),
                                       message: Text("error message friendly to user"),
                                       dismissButton: .default(Text("Ok")))
    static let savedSuccessfully = AlertItem(title: Text("savedSuccessfully"),
                                       message: Text("error message friendly to user"),
                                       dismissButton: .default(Text("Ok")))
    static let invaidUserData = AlertItem(title: Text("Error->invalidUserData, "),
                                       message: Text("error message friendly to user"),
                                       dismissButton: .default(Text("Ok")))
}
