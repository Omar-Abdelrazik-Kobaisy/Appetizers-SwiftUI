//
//  AppetizerListItemView.swift
//  Appetizers
//
//  Created by Omar on 26/12/2023.
//

import SwiftUI


extension Image {
    func modifier() -> some View{
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120 , height: 90)
            .cornerRadius(10)
    }
}
struct AppetizerListItemView: View {
    var appetizer: Appetizer
    var body: some View {
        HStack{
//            AsyncImage(url: URL(string:appetizer.imageURL)) { image in
//                image
//                    .modifier()
//            } placeholder: {
//                Image(systemName: "photo.fill.on.rectangle.fill")
//                    .modifier()
//            }
            AppetizerRemoteImage(url: appetizer.imageURL)
            VStack(alignment:.leading,spacing: 5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price,specifier: "%.2f")")
                    .font(.system(size: 18,weight: .regular))
                    .foregroundColor(.secondary)
                    .fontWeight(.bold)
            }
            .padding(.leading, 25)
        }
    }
}
struct AppetizerListItemView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListItemView(appetizer: MockData.sampleData)
    }
}
