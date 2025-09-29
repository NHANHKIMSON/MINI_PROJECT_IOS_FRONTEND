// MARK: - Welcome
struct ProductNewModel: Codable {
    let message, status: String
    let payload: [PayloadProduct]
    let time: String
}

// MARK: - Payload
struct PayloadProduct: Codable,Identifiable {
    let id: Int
    let name, image: String
    let isFavorite: Bool
    let price: Double
    let category: Categories
    let productDetail: String?
}

// MARK: - Category
struct Categories: Codable {
    let id: Int
    let name, icon: String
}

