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

struct ProductDetail {
    let id: String
    let name: String
    let price: Double
    let images: [String]
    let condition: String
    let brand: String
    let model: String
    let color: String
    let year: String
    let size: String
    let type: String
    let description: String
}

extension ProductDetail {
    static let mockProduct = ProductDetail(
        id: "#123400",
        name: "iPhone 15 Pro Max 256gb (LL)",
        price: 1750.00,
        images: ["Product1", "Product2", "Product3", "Product4"],
        condition: "New",
        brand: "Apple",
        model: "iPhone 15 Pro Max",
        color: "Natural titanium",
        year: "2023",
        size: "XL",
        type: "—",
        description: "The product is only for sale and available in Phnom Penh only."
    )
}
