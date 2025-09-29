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
                                    CardVerticle(geo: geo, name: pro.name, image: pro.image)
                                }
                            }
                        }else{
                            LazyVGrid(columns: oneColumn, spacing: geo.size.height * 0.02){
                                NavigationLink(destination : ItemDetailView()){
                                    Card(geo: geo)
                                }
                                Card(geo: geo)
                                Card(geo: geo)
                                Card(geo: geo)
                                Card(geo: geo)
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
