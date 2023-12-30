//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Omar on 25/12/2023.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var vm = AppetizerListViewModel()
//    @State private var isShowingDetail = false
//    @State private var selectedAppetizer: Appetizer?
    var body: some View {
        ZStack{
            NavigationStack{
                if let appetizers = vm.appetizers {
                    List(appetizers){appetizer in
                        AppetizerListItemView(appetizer: appetizer)
                            .onTapGesture {
                                vm.isShowingDetail = true
                                vm.selectedAppetizer = appetizer
                            }
                    }
                    .listStyle(.plain)
                    .navigationTitle("🍟 Appetizers")
                    .disabled(vm.isShowingDetail)
                }
            }
            .blur(radius: vm.isShowingDetail ? 10 : 0)
            
            if vm.isShowingDetail{
                // we need trak the selected item(appetizer item)
                DetailView(appetizer: vm.selectedAppetizer ?? MockData.sampleData, isShowingDetail: $vm.isShowingDetail)
                
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

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}


