//
//  ExploreView.swift
//  Easy Card App
//
//  Created by Apple on 9/26/25.
//

import SwiftUI
import Combine
struct SaveProductView: View {
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
                    Group{
                        VStack{
                            if signleColumn{
                                LazyVGrid(columns: columns, spacing: geo.size.height * 0.028){
                                    ForEach(productViewModel.products, id: \.id){ pro in
                                        CardVerticle(geo: geo, isFavorite: pro.isFavorite, id: pro.id, name: pro.name, image: pro.image)
                                    }
                                    .padding(12)
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
                                .padding(12)
                            }
                        }
                        .padding(.horizontal, 12)
                        .onAppear(perform: productViewModel.getAllProductIsFavorite)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ContentView()
}
