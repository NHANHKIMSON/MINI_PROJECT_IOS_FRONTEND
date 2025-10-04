//
//  CategoryViewModel.swift
//  Easy Card App
//
//  Created by Apple on 9/27/25.
//
import Foundation
import Alamofire
import Combine

class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []

    @MainActor func getAllCategory() {
        let url = "http://localhost:9090/api/v1/category"
        
        AF.request(url)
            .validate()
            .responseDecodable(of: CategoryResponse.self) { response in
                switch response.result {
                case .success(let data):
                    self.categories = data.payload
                case .failure(let error):
                    print("sss \(error)")
                }
            }
    }
}
