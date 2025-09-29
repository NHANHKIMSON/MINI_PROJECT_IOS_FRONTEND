//
//  SavedView.swift
//  Easy Card App
//
//  Created by Mac on 29/9/25.
//

import SwiftUI


struct SavedView: View {
    @EnvironmentObject var bookmarkManager: BookmarkManager
    @Binding var signleColumn: Bool
    
    @ObservedObject var savedViewModel = SavedViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    let oneColumn = [
        GridItem(.flexible()),
    ]
    
    @State var allSavedData: [PayloadProduct] = []
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                if signleColumn {
                    if savedViewModel.allSavedData.isEmpty {
                        VStack(spacing: 16) {
                            Image(systemName: "bookmark.slash")
                                .font(.system(size: 50))
                                .foregroundStyle(.gray)
                            Text("No saved items yet")
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.top, 150)
                    } else {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(savedViewModel.allSavedData, id: \.id) { item in
                                CardVerticle(
                                    geo: geo,
                                    name: item.name,
                                    image: item.image,
                                    isFavorite: item.isFavorite,
                                    price: "\(item.price)",
                                    itemID: "\(item.id)"
                                )
                                .frame(height: geo.size.height * 0.31)
                            }
                        }
                        .padding(.horizontal, 5)
                    }
                }else{
                    if savedViewModel.allSavedData.isEmpty {
                        VStack(spacing: 16) {
                            Image(systemName: "bookmark.slash")
                                .font(.system(size: 50))
                                .foregroundStyle(.gray)
                            Text("No saved items yet")
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.top, 150)
                    } else {
                        LazyVGrid(columns: oneColumn, spacing: 16) {
                            ForEach(bookmarkManager.savedItems, id: \.self) { item in
                                Card(geo: geo, itemID: item)
                                    .frame(height: geo.size.height * 0.2)
                            }
                        }
                        .padding(.horizontal, 5)
                    }

                }
            }
            .onAppear() {
                savedViewModel.getAllSaved()
                
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(BookmarkManager())
}
