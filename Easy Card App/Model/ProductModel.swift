//
//  ProductModel.swift
//  Easy Card App
//
//  Created by Apple on 9/28/25.
//
import SwiftUI
import Alamofire
import Foundation

struct ProductResponse: @nonisolated Codable {
    let message, status: String
    let payload: [Product]
    let time: String
}

struct Product: Codable {
    let id: Int
    let name: String
    let imagesUrl: [String]
    let isFavorite: Bool
    let price: Double?
    let category: Category
    let productDetail: ProductDetail
}

struct ProductDetail: Codable {
    let id: Int
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
        id: 123400,
        name: "iPhone 15 Pro Max 256gb (LL)",
        imagesUrl: ["Product1", "Product2", "Product3", "Product4"],
        isFavorite: false,
        price: 1750.00,
        category: Category(id: 1, name: "Electronics", icon: "iphone"),
        productDetail: ProductDetail(
            id: 1,
            condition: "New",
            brand: "Apple",
            model: "iPhone 15 Pro Max",
            color: "Natural titanium",
            year: "2023",
            size: "XL",
            type: "—",
            description: "The product is only for sale and available in Phnom Penh only."
        )
    )
}



func uploadfile(image : Data,completed : @escaping(File?)->Void)  {
    let url = "http://localhost:9090/api/v1/file/upload"
    let headers  : HTTPHeaders = ["Content-Type": "multipart/form-data"]
    
    AF.upload(multipartFormData: { multipartFormData in
        multipartFormData.append(image, withName: "file",fileName: ".png",mimeType: "Image/*")
        
    }, to: url,headers: headers).validate().responseDecodable(of: File.self) { response in
        switch response.result{
        case .success(let file):
            completed(file)
            print("upload image success")
        case .failure(let error):
            completed(nil)
            print("error posting image", error.localizedDescription)
        }
    }
}

func postProduct(
    condition: String,
    brand: String,
    model: String,
    color: String,
    year: String,
    size: String,
    type: String,
    description: String,
    name: String,
    imagesURL: [String],
    isFavorite: Bool,
    categoryId: Int,
    completed: @escaping (Bool)-> Void
) {
    let url = "http://localhost:9090/api/v1/product"
    
    let productDetail = ProductDetailAddNewProduct(condition: condition, brand: brand, model: model, color: color, year: year, size: size, type: type, description: description)
    let userInput = AddNewProductModel(name: name, imagesURL: imagesURL, isFavorite: false, categoryID: categoryId, productDetailAddNewProduct: productDetail )
    
    AF.request(url, method: .post, parameters:  userInput, encoder: JSONParameterEncoder.default)
        .validate()
        .responseData { response in
            switch response.result {
            case .success(let data):
                print( "success post product")
                completed(true)
            case .failure(let error):
                completed(false)
                print("Error post product", error.localizedDescription)
        }
    }
}
