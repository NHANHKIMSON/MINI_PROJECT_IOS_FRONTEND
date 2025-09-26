//
//  TabModel.swift
//  Easy Card App
//
//  Created by Apple on 9/19/25.
//

import Foundation


struct TabModel{
    var image: String
    var title: String
}

class BookmarkManager: ObservableObject {
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
