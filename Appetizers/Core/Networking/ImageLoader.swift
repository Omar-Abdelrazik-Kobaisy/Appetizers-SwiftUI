//
//  ImageLoader.swift
//  Appetizers
//
//  Created by Omar on 27/12/2023.
//

import SwiftUI

final class ImageLoader: ObservableObject{
    @Published var image: Image?
    
    func load(fromURLString url: String){
        NetworkManager.shared.downloadImage(fromURLString: url) { [weak self] uiImage in
            guard let self,
                  let uiImage = uiImage else{ return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View{
    var image: Image?
    var body: some View{
        image?.modifier()
            .cornerRadius(10) ?? Image("food-placeholder").modifier().cornerRadius(10)
    }
}

struct AppetizerRemoteImage: View{
    @StateObject var imageLoader: ImageLoader = ImageLoader()
    let url: String
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromURLString: url)
            }
    }
}
