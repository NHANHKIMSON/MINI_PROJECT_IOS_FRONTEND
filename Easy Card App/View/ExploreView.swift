//
//  ExploreView.swift
//  Easy Card App
//
//  Created by Apple on 9/26/25.
//

import SwiftUI
import Combine
struct ExploreView: View {
    @ObservedObject var viewModel = CategoryViewModel()
    @ObservedObject var productViewModel = ProductViewModel()
    let oneColumn = [
        GridItem(.flexible()),
    ]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    @Binding var signleColumn: Bool
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                VStack(spacing: 16){
                        LazyVGrid(columns: columns){
                            ForEach(viewModel.categories, id: \.id) { category in
                            CategoryCard(geo: geo, name: category.name, icon: category.icon)
                        }
                    }
                    
                    HStack{
                        Text("Top Item")
                        Spacer()
                    }
                    Group{
                        if signleColumn{
                            LazyVGrid(columns: columns, spacing: geo.size.height * 0.02){
                                ForEach(productViewModel.products, id: \.id){ pro in
                                    CardVerticle(
                                        geo: geo,
                                        name: pro.name,
                                        image: pro.image,
                                        isFavorite: pro.isFavorite ?? nil,
                                        price: pro.price != nil ? "\(pro.price!)" : nil,
                                        itemID: "\(pro.id)"
                                    )
                                }
                            }
                        }else{
                            LazyVGrid(columns: oneColumn, spacing: geo.size.height * 0.02){
                                Card(geo: geo, itemID: "1")
                                Card(geo: geo, itemID: "2")
                                Card(geo: geo, itemID: "3")
                                Card(geo: geo, itemID: "4")
                                Card(geo: geo, itemID: "5")
                            }
                        }
                    }
                    .onAppear(perform: productViewModel.getAllProduct)
                }
                .onAppear(perform: viewModel.getAllCategory)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ContentView()
}
