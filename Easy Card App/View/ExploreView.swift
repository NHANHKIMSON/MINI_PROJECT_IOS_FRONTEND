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
                        Text("Top Items")
                            .font(.headline)
                        Spacer()
                    }
                    Group{
                        if signleColumn{
                            LazyVGrid(columns: columns, spacing: geo.size.height * 0.02){
                                NavigationLink(destination: ItemDetailView()) {
                                    CardVerticle(geo: geo)
                                }
                                NavigationLink(destination: ItemDetailView()) {
                                    CardVerticle(geo: geo)
                                }
                                NavigationLink(destination: ItemDetailView()) {
                                    CardVerticle(geo: geo)
                                }
                                
                                NavigationLink(destination: ItemDetailView()) {
                                    CardVerticle(geo: geo)
                                }

                                NavigationLink(destination: ItemDetailView()) {
                                    CardVerticle(geo: geo)
                                }

                                NavigationLink(destination: ItemDetailView()) {
                                    CardVerticle(geo: geo)
                                }

                                NavigationLink(destination: ItemDetailView()) {
                                    CardVerticle(geo: geo)
                                }

                                NavigationLink(destination: ItemDetailView()) {
                                    CardVerticle(geo: geo)
                                }

                                NavigationLink(destination: ItemDetailView()) {
                                    CardVerticle(geo: geo)
                                }


                            }
                        }else{
                            LazyVGrid(columns: oneColumn, spacing: geo.size.height * 0.02){
                                Card(geo: geo)
                                Card(geo: geo)
                                Card(geo: geo)
                                Card(geo: geo)
                                Card(geo: geo)
                            }
                        }
                    }
                }
                .onAppear(perform: viewModel.fetchPosts)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ContentView()
}


