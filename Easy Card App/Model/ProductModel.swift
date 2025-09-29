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
