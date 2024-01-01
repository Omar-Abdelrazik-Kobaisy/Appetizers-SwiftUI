//
//  Order.swift
//  Appetizers
//
//  Created by Omar on 01/01/2024.
//

import Foundation
import SwiftUI

final class Order: ObservableObject{
    
    @Published var OrderItems: [Appetizer] = []
    
    var totalPrice: Double{
        OrderItems.reduce(0.0) {
            $0 + $1.price
        }
    }
}
