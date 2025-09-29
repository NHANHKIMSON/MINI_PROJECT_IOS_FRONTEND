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

    func getAllCategory() {
        let url = "http://localhost:9090/api/v1/category"
        
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decoded = try JSONDecoder().decode(CategoryResponse.self, from: data)
                        self.categories = decoded.payload
                    } catch {
                        print("Something went wrong")
                    }
                case .failure(let error):
                    print("Error: \(error)")
            }
        }
    }
}
