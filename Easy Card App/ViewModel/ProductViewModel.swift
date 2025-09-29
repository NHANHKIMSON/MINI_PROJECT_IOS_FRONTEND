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
    func changeStatus(){
        
    }
}
//AF.request(url)
//    .validate()
//    .responseDecodable(of: CategoryResponse.self) { response in
//        switch response.result {
//        case .success(let data):
//            categories = data.payload
//        case .failure(let error):
//            errorMessage = error.localizedDescription
//        }
//    }
