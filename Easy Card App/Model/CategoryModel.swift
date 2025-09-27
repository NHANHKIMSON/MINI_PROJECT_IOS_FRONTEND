//
//  CategoryModel.swift
//  Easy Card App
//
//  Created by Apple on 9/27/25.
//

import Foundation

struct Category: Decodable, Sendable {
    let id: Int
    let name: String
    let icon: String
}

struct CategoryResponse: Decodable {
    let payload: [Category]
}
