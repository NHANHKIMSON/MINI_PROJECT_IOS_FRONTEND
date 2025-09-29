//
//  CategoryDetail.swift
//  Easy Card App
//
//  Created by Eang Kimlong on 9/26/25.
//

import SwiftUI
struct CategoryDetailScreen : View {
    @ObservedObject var productViewModel = ProductViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    @Environment(\.dismiss) var dismiss
    @State private var searchText: String = ""
    @State private var isSaved: String = ""
    var body: some View {
        VStack{
            HStack(spacing: 20){
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                    .frame(width: 20, height: 20)
                TextField("Search", text: $searchText)
                    .onSubmit {
                        productViewModel.getAllProductByTitle(title: searchText)
                    }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color(.systemGray5))
            .cornerRadius(10)
            
            GeometryReader{ geo in
                ScrollView{
                    LazyVGrid(columns: columns, spacing: geo.size.height * 0.02){
                        //
                        ForEach(productViewModel.products, id: \.id){ pro in
                            CardVerticle(geo: geo, name: pro.name, image: pro.image)
                        }
                    }
                    .onAppear(perform: productViewModel.getAllProduct
                    )
                }
                .scrollIndicators(.hidden)
            }
        }
        .padding(.top, 15)
        .padding(10)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "multiply")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .padding()
                        .foregroundStyle(.black)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Electronic")
                    .font(.headline)
            }
        }
        
    }
}

#Preview {
    CategoryDetailScreen()
}
