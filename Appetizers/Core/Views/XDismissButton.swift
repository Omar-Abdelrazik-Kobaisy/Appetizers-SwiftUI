//
//  XDismissButton.swift
//  Appetizers
//
//  Created by Omar on 30/12/2023.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 40 , height: 40)
                .foregroundColor(.white)
                .opacity(0.5)

            Image(systemName: "xmark.octagon")
                .imageScale(.large)
                .frame(width: 45 , height: 45)
                .foregroundColor(.black)
        }
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton()
    }
}
