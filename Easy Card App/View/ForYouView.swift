//
//  ForYouView.swift
//  Easy Card App
//
//  Created by Apple on 9/23/25.
//

import SwiftUI

struct ForYouView: View {
    @ObservedObject var viewModel = ProductViewModel()
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
                if signleColumn{
                    LazyVGrid(columns: columns, spacing: geo.size.height * 0.028){
                        ForEach(viewModel.products, id: \.id){ pro in
                            CardVerticle(geo: geo, isFavorite: pro.isFavorite, name: pro.name, image: pro.image)
                        }
                    }
                    .padding(10)
                    .onAppear(perform: viewModel.getAllProduct)
                }else{
                    LazyVGrid(columns: oneColumn, spacing: geo.size.height * 0.001){
                        ForEach(viewModel.products, id: \.id){ pro in
                            Card(geo: geo, name: pro.name, image: pro.image)
                        }
                    }
                    .padding(.horizontal, 12)
                    .onAppear(perform: viewModel.getAllProduct)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ContentView()
}
