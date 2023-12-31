//
//  EmptyState.swift
//  Appetizers
//
//  Created by Omar on 31/12/2023.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text(message)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(imageName: "empty-order",
                   message: "testtesttest\ntesttesttesttesttesttesttesttesttesttest ")
    }
}
