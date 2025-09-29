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
                    LazyVGrid(columns: columns, spacing: geo.size.width * 0.03){
                            ForEach(viewModel.categories, id: \.id) { category in
                                CategoryCard(geo: geo, id: category.id, name: category.name, icon: category.icon)
                        }
                    }
                    .padding(12)
                    
                    Group{
                        HStack{
                            Text("Top Item")
                            Spacer()
                        }
                        .padding(.leading, 12)
                        VStack{
                            if signleColumn{
                                LazyVGrid(columns: columns, spacing: geo.size.height * 0.028){
                                    ForEach(productViewModel.products, id: \.id){ pro in
                                        CardVerticle(geo: geo, isFavorite: pro.isFavorite, id: pro.id, name: pro.name, image: pro.image)
                                    }
                                }
                            }else{
                                LazyVGrid(columns: oneColumn, spacing: geo.size.height * 0.001){
                                    ForEach(productViewModel.products, id: \.id){ pro in
                                        NavigationLink(destination: ItemDetailView()){
                                            Card(geo: geo, isFavorite: pro.isFavorite, id: pro.id, name: pro.name, image: pro.image)
                                        }
                                        .buttonStyle(CustomButtonStyle())
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 12)
                        .onAppear(perform: productViewModel.getAllProduct)
                    }
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
