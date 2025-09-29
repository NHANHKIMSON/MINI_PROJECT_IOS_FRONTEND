//
//  ProductModel.swift
//  Easy Card App
//
//  Created by Apple on 9/28/25.
//

import Foundation
struct ProductResponse: Codable, Sendable {
    let message, status: String
    let payload: [Product]
    let time: String
}

struct Product: Codable, Sendable {
    let id: Int
    let name: String
    let image: String
    let isFavorite: Bool
    let price: Double
    let category: Category
}
