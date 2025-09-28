//
//  SavedView.swift
//  Easy Card App
//
//  Created by Mac on 25/9/25.
//

import SwiftUI

struct SavedView: View {
    @EnvironmentObject var bookmarkManager: BookmarkManager
    @Binding var signleColumn: Bool
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    let oneColumn = [
        GridItem(.flexible()),
    ]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                if signleColumn {
                    if bookmarkManager.savedItems.isEmpty {
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
                            ForEach(bookmarkManager.savedItems, id: \.self) { item in
                                if let id = Int(item) {
                                    CardVerticle(geo: geo, itemID: id)
    //                                    .frame(height: 270)
                                        .frame(height: geo.size.height * 0.43)
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                    }
                }else{
                    if bookmarkManager.savedItems.isEmpty {
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
                                if let id = Int(item) {
                                    Card(geo: geo, itemID: id)
                                        .frame(height: geo.size.height * 0.2)
                                }
                            }
                        }
                        .padding(.horizontal, 5)
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
