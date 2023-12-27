//
//  Appetizer.swift
//  Appetizers
//
//  Created by Omar on 25/12/2023.
//

import Foundation

struct Appetizer: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Double
    let description: String
    let imageURL: String
    let protein: Int
    let calories: Int
    let carbs: Int
}

struct AppetizerResponse: Codable{
    let request: [Appetizer]
}

struct MockData {
    static let sampleData = Appetizer(id: 0001,
                                      name: "Test",
                                      price: 9.99,
                                      description: "this is test description",
                                      imageURL: "",
                                      protein: 11,
                                      calories: 200,
                                      carbs: 2)
    
    static let appetizers = [sampleData , sampleData , sampleData , sampleData]
}
