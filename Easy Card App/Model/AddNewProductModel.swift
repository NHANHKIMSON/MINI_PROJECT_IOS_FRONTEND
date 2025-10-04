import Foundation
import SwiftUI

struct AddNewProductModel: @nonisolated Codable {
    let name: String
    let imagesURL: [String]
    let isFavorite: Bool
    let categoryID: Int
    let productDetailAddNewProduct: ProductDetailAddNewProduct

    enum CodingKeys: String, CodingKey {
        case name
        case imagesURL = "imagesUrl"
        case isFavorite
        case categoryID = "categoryId"
        case productDetailAddNewProduct = "productDetail"
    }
}

