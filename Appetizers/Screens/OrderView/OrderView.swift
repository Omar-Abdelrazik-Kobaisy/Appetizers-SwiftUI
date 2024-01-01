//
//  OrderView.swift
//  Appetizers
//
//  Created by Omar on 25/12/2023.
//

import SwiftUI

struct OrderView: View {
    //MARK: properties
//    @State private var orderItems = MockData.orderItems
    @EnvironmentObject var order: Order
    @State private var showAlert = false
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    List{
                        ForEach(order.OrderItems) { order in
                            AppetizerListItemView(appetizer: order)
                        }
                        .onDelete(perform: deleteItems(at:))
                    }
                    .listStyle(.plain)
                    
                    Button {
                        showAlert = true
                    } label: {
                        ApButton(title: "$\(order.totalPrice,specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom , 30)

                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("Order Placed"),
                    message: Text("your order placed successfully🎉"),
                          dismissButton: .cancel(Text("ok")))
                }
                
                if order.OrderItems.isEmpty{
                    EmptyState(imageName: "empty-order",
                               message: "Add something to your Cart 🛒")
                }
            }
            .navigationTitle("Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet){
        order.OrderItems.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
