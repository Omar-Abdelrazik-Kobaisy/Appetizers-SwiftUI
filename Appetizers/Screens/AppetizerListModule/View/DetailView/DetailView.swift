//
//  DetailView.swift
//  Appetizers
//
//  Created by Omar on 29/12/2023.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var order: Order
    var appetizer: Appetizer // no need to be @Binding cuz we nedd to read only not read and write
    @Binding var isShowingDetail: Bool
    var body: some View {
            VStack{
                AppetizerRemoteImage(url: appetizer.imageURL)
                    .frame(width: 300,height: 225)
                VStack{
                    Text(appetizer.name)
                        .font(.title)
                    Text(appetizer.description)
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .padding(15)
                }
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.6)
                .lineLimit(nil)
                HStack(spacing:30){
                    NutritionInfo(title: "Calories",
                                  value: appetizer.calories)
                    NutritionInfo(title: "Carbs",
                                  value: appetizer.carbs)
                    NutritionInfo(title: "Protein",
                                  value: appetizer.protein)
                }.font(.title3)
                    .multilineTextAlignment(.center)
                    .padding(.top,25)

                Spacer()

                Button {
                    order.OrderItems.append(appetizer)
                    withAnimation {
                        isShowingDetail = false
                    }
                } label: {
//                    ApButton(title: "$\(appetizer.price,specifier: "%.2f") - Add To Order")
                    Text("$\(appetizer.price,specifier: "%.2f") - Add To Order")
                }
                .modifier(StandardButtonStyle())
                .padding(.bottom,30)

            }
            .frame(width: 300 , height: 560 , alignment: .center)
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .shadow(radius: 10)
            .overlay(alignment:.topTrailing) {
                Button {
                    isShowingDetail = false
                } label: {
                    XDismissButton()
                }
            }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(appetizer: MockData.sampleData, isShowingDetail: .constant(true))
            .environmentObject(Order())
    }
}

struct NutritionInfo: View{
    let title: String
    let value: Int
    var body: some View{
        VStack(spacing:8){
            Text(title)
            Text("\(value)")
                .foregroundColor(.secondary)
                .italic()
        }
    }
}
