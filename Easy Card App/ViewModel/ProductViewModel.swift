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
    @Published var newDataProduct: [PayloadProduct] = []
     
    func getAllProduct() {
        let url = "http://localhost:9090/api/v1/product"
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decoded = try JSONDecoder().decode(ProductResponse.self, from: data)
//                        self.products = decoded.payload
                    } catch {
                        print("Something went wrong")
                    }
                case .failure(let error):
                    print("Error \(error)")
            }
        }
    }
    
    
    func getProducts(completion : @escaping ([PayloadProduct],Bool) -> Void){
        let url = "http://localhost:9090/api/v1/product"
        AF.request(url)
            .validate()
            .responseDecodable(of: ProductNewModel.self) { response in
                switch response.result {
                case .success(let data):
                    completion(data.payload,true)
                    print(data)
                case .failure(let error):
//                    completion(nil,false)
                    print("Error : ",error)
                }
            }
    }
}
