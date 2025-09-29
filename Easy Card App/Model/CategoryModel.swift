//
//  CategoryModel.swift
//  Easy Card App
//
//  Created by Apple on 9/27/25.
//

import Foundation

struct Category: Codable {
    let id: Int
    let name: String
    let icon: String
}

struct CategoryResponse: Codable {
    let payload: [Category]
}
