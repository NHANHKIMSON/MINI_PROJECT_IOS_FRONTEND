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
                        Text("Top Item")
                        Spacer()
                    }
                    Group{
                        if signleColumn{
                            LazyVGrid(columns: columns, spacing: geo.size.height * 0.02){
                                CardVerticle(geo: geo)
                                CardVerticle(geo: geo)
                                CardVerticle(geo: geo)
                                CardVerticle(geo: geo)
                                CardVerticle(geo: geo)
                                CardVerticle(geo: geo)
                                CardVerticle(geo: geo)
                                CardVerticle(geo: geo)
                                CardVerticle(geo: geo)
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


struct CategoryCard: View {
    @State var geo: GeometryProxy
    @State var name: String
    @State var icon: String
    var body: some View {
        Button(action: {}, label: {
            HStack{
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                Text(name)
                    .lineLimit(1)
            }
            .padding()
            .frame(width: geo.size.width * 0.48)
            .background(.white)
            .cornerRadius(10)
        })
        .buttonStyle(CustomButtonStyle())
    }
}
