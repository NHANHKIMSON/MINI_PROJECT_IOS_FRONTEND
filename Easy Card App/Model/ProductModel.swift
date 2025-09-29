//
//  ProductModel.swift
//  Easy Card App
//
//  Created by Apple on 9/28/25.
//

import Foundation

struct ProductResponse: Codable {
    let payload: [Product]
}

struct Product: Codable {
    let id: Int
    let name: String
    let image: String?
    let isFavorite: Bool?
    let price: Int?        
}

class BookmarkManager: ObservableObject, Identifiable {
    @Published var id: UUID = UUID()
    @Published var savedItems: [String] = []

    func toggleBookmark(for item: String) {
        if savedItems.contains(item) {
            savedItems.removeAll { $0 == item }
        } else {
            savedItems.append(item)
        }
    }

    func isBookmarked(_ item: String) -> Bool {
        savedItems.contains(item)
    }
}

