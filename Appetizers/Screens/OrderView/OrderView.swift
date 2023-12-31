//
//  OrderView.swift
//  Appetizers
//
//  Created by Omar on 25/12/2023.
//

import SwiftUI

struct OrderView: View {
    //MARK: properties
    @State private var orderItems = MockData.orderItems
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    List{
                        ForEach(orderItems) { order in
                            AppetizerListItemView(appetizer: order)
                        }
                        .onDelete(perform: deleteItems(at:))
                    }
                    .listStyle(.plain)
                    
                    Button {
                        
                    } label: {
                        ApButton(title: "$99.99 - Place Order")
                    }
                    .padding(.bottom , 30)

                }
                
                if orderItems.isEmpty{
                    EmptyState(imageName: "empty-order",
                               message: "Add something to your Cart 🛒")
                }
            }
            .navigationTitle("Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet){
        orderItems.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
