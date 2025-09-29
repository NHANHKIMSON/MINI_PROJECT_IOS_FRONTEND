struct ProductModel: Codable {
    let name: String
    let imagesURL: [String]
    let isFavorite: Bool
    let categoryID: Int
    let productDetail: ProductDetail

    enum CodingKeys: String, CodingKey {
        case name
        case imagesURL = "imagesUrl"
        case isFavorite
        case categoryID = "categoryId"
        case productDetail
    }
}

