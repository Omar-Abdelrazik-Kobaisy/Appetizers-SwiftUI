//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Omar on 27/12/2023.
//

import Foundation

class AppetizerListViewModel: ObservableObject{
    @Published private(set) var appetizers: [Appetizer]?
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    init(){
        getAppetizers()
    }
    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizers { [weak self]result in
            guard let self else{
                return
            }
            DispatchQueue.main.async {
                self.isLoading = false
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers.request
                case .failure(let error):
                    print(error.localizedDescription)
                    switch error{
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    }
                }
            }
        }
    }
}
