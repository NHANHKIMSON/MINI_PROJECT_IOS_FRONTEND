//
//  CategoryDetail.swift
//  Easy Card App
//
//  Created by Eang Kimlong on 9/26/25.
//

import SwiftUI
struct CategoryDetailScreen : View {
//    let imageUrl = ["watch", "iphone", "iphone 1", "iphone2", "iphone3", "delivery package boxes"]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    @Environment(\.dismiss) var dismiss
    @State private var searchText: String = ""
    @State private var isSaved: String = ""
//    var filteredItems: [String] {
//        if searchText.isEmpty {
//            return imageUrl
//        } else {
//            return imageUrl.filter { $0.localizedCaseInsensitiveContains(searchText) }
//        }
//    }
    var body: some View {
        VStack{
            HStack(spacing: 20){
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                    .frame(width: 20, height: 20)
                TextField("Search", text: $searchText)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color(.systemGray5))
            .cornerRadius(10)
            
            GeometryReader{ geo in
                ScrollView{
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
                }
                .scrollIndicators(.hidden)
            }
//            ScrollView(.vertical, showsIndicators: false) {
//                LazyHGrid(
//                    rows: Array(repeating: GridItem(.flexible(minimum: 250)), count: (filteredItems.count + 1) / 2),
//                    spacing: 20
//                ) {
//                    ForEach(filteredItems.indices, id: \.self) { index in
//                        CustomVerticalCard(
//                            imageUrl: filteredItems[index],
//                            title: "Apple Watch",
//                            price: "$1400"
//                        )
//                    }
//                }
//            }
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
