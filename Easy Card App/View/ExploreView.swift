//
//  ExploreView.swift
//  Easy Card App
//
//  Created by Apple on 9/26/25.
//

import SwiftUI
struct ExploreView: View {
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
                        CategoryCard(geo: geo)
                        CategoryCard(geo: geo)
                        CategoryCard(geo: geo)
                        CategoryCard(geo: geo)
                        CategoryCard(geo: geo)
                        CategoryCard(geo: geo)
                        CategoryCard(geo: geo)
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
    var body: some View {
        Button(action: {}, label: {
            HStack{
                Image("car")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                Text("Automobile")
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
