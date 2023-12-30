//
//  ApButton.swift
//  Appetizers
//
//  Created by Omar on 30/12/2023.
//

import SwiftUI

struct ApButton: View {
    var title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 280 , height: 60)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

struct ApButton_Previews: PreviewProvider {
    static var previews: some View {
        ApButton(title: "Test Title")
    }
}
