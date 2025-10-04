//
//  ProductViewModel.swift
//  Easy Card App
//
//  Created by Apple on 9/28/25.
//
import Foundation
import Alamofire
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []

    func getAllProduct() {
        let url = "http://localhost:9090/api/v1/product"
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decoded = try JSONDecoder().decode(ProductResponse.self, from: data)
                        self.products = decoded.payload
                    } catch {
                        print("Something went wrong")
                    }
                case .failure(let error):
                    print("Error \(error)")
            }
        }
    }
    func getAllProductIsFavorite() {
        let url = "http://localhost:9090/api/v1/product/isFavorite"
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decoded = try JSONDecoder().decode(ProductResponse.self, from: data)
                        self.products = decoded.payload
                    } catch {
                        print("Something went wrong")
                    }
                case .failure(let error):
                    print("Error \(error)")
            }
        }
    }
    
    
    
    
    func getAllProductByTitle(title: String) {
        let url = "http://localhost:9090/api/v1/product/search?title=\(title)"
        AF.request(url)
            .validate()
            .responseDecodable(of: ProductResponse.self){ response in
                switch response.result{
                case .success(let data):
                    self.products = data.payload
                case .failure(let error):
                    print("Error: \(error)")
                }
        }
    }
    func getAllProductByCategoryId(id: Int) {
        let url = "http://localhost:9090/api/v1/product/category/1"
        AF.request(url)
            .validate()
            .responseDecodable(of: ProductResponse.self){ response in
                switch response.result{
                case .success(let data):
                    self.products = data.payload
                case .failure(let error):
                    print("Error: \(error)")
                }
        }
    }
    func changeStatus(id: Int, isFavorite: Bool) {
        let url = "http://localhost:9090/api/v1/product/\(id)"
        let params: [String: Any] = [
            "isFavorite": isFavorite
        ]
        AF.request(
            url,
            method: .patch,
            parameters: params,
            encoding: JSONEncoding.default
        )
        .validate()
        .responseDecodable(of: ProductResponse.self) { response in
            switch response.result {
            case .success(let data):
                self.products = data.payload
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

