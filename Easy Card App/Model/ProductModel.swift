//
//  ProductModel.swift
//  Easy Card App
//
//  Created by sovanara  on 27/9/25.
//

import Foundation

struct Product {
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

extension Product {
    static let mockProduct = Product(
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

