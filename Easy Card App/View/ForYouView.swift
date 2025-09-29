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
    
    @State var data : [PayloadProduct] = []
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
               
                if signleColumn{
                    LazyVGrid(columns: columns, spacing: geo.size.height * 0.02){
                        ForEach(data) { data in
                            CardVerticle(
                                geo: geo,
                                name: data.name,
                                image: data.image,
                                isFavorite: data.isFavorite,
                                price: "\((data.price))",
                                itemID: "\(data.id)"
                            )
                        }
                    }
//                    .onAppear(perform: viewModel.getAllProduct)
                }else{
                    LazyVGrid(columns: oneColumn, spacing: geo.size.height * 0.02){
                        ForEach(data) { data in
                            Card(
                                geo: geo,
                                name: data.name,
                                image: data.image,
                                isFavorite: data.isFavorite,
                                price: "\(data.price)",
                                itemID: "\(data.id)")
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .onAppear{
                viewModel.getProducts { data, success in
                    if success {
                        self.data = data
                    }else{
                        print("Error")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(BookmarkManager())
}
