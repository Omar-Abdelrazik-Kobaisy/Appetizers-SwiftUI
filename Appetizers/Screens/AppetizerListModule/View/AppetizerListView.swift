//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Omar on 25/12/2023.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var vm = AppetizerListViewModel()
    var body: some View {
        ZStack{
            NavigationStack{
                if let appetizers = vm.appetizers {
                    List(appetizers){appetizer in
                        AppetizerListItemView(appetizer: appetizer)
                    }
                    .listStyle(.plain)
                    .navigationTitle("🍟 Appetizers")
                }
                
                if vm.isLoading{
                    LoadingView()
                }
            }
            .alert(item: $vm.alertItem) { alertItem in
                Alert(
                    title: alertItem.title,
                    message: alertItem.message,
                    dismissButton: alertItem.dismissButton)
            }
            
        }
    }
    
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}


