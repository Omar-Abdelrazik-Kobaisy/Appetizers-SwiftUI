//
//  CustomeModifiers.swift
//  Appetizers
//
//  Created by Omar on 03/01/2024.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
