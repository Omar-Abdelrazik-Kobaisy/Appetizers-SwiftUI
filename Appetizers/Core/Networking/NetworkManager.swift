//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Omar on 26/12/2023.
//

import Foundation
import UIKit

enum APError: Error{
    case invalidURL
    case invalidResponse
    case unableToComplete
    case invalidData
}

final class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    private var appetizerURL: String {
        baseURL + "/appetizers"
    }
    
    private var cache = NSCache<NSString,UIImage>()
    
    private init() {}
    
    func getAppetizers(completion: @escaping (Result<AppetizerResponse , APError>) -> Void){
        guard let url = URL(string: appetizerURL) else{
            completion(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else{
                completion(.failure(.unableToComplete))
                return
            }
            guard let data = data else{
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else{
                completion(.failure(.invalidResponse))
                return
            }
            do{
                let result = try JSONDecoder().decode(AppetizerResponse.self,
                                                      from: data)
                completion(.success(result))
            }catch(let error){
                print(error.localizedDescription)
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    func downloadImage(fromURLString url: String, completion: @escaping((UIImage?) -> Void)){
        if let image = cache.object(forKey: NSString(string: url)){
            completion(image)
            return
        }
        let task = URLSession.shared.dataTask(with: URL(string: url)!) {[weak self] data, response, error in
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  error == nil,
                  let self else {
                completion(nil)
                return
            }
            
            guard let data = data,
                  let uiImage = UIImage(data: data) else{
                completion(nil)
                return
            }
            self.cache.setObject(uiImage, forKey: NSString(string: url))
            print("image loaded")
            completion(uiImage)
        }
        task.resume()
    }
}
