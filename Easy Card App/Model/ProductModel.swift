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

struct Product: @nonisolated Codable {
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
            case .failure(let error):
                print("Error post product", error.localizedDescription )
        }
    }
}
