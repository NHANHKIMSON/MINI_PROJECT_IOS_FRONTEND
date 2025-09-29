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
//                        ForEach(data) { data in
//                            Text("\(data.isFavorite)")
//                        }
                        
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
                    .onAppear(perform: viewModel.getAllProduct)
                    .onAppear{
                        viewModel.getProducts { data, success in
                            if success {
                                self.data = data
                            }else{
                                print("Error")
                            }
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
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(BookmarkManager())
}
