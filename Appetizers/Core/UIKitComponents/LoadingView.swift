//
//  LoadingView.swift
//  Appetizers
//
//  Created by Omar on 27/12/2023.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable{
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeUIView(context: Context) -> some UIActivityIndicatorView {
        // replace the body on the view
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .brandPrimary
        spinner.startAnimating()
        return spinner
    }
    
}

struct LoadingView: View {
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ActivityIndicator()
        }
    }
}
