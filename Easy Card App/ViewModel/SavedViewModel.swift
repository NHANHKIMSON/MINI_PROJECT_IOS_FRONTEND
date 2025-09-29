
import Alamofire
import Foundation
import Combine

class SavedViewModel: ObservableObject {
    @Published var allSavedData: [PayloadProduct] = []

    func getAllSaved() {
        let url = "http://localhost:9090/api/v1/product/isFavorite"
        AF.request(url)
            .validate()
            .responseDecodable(of: ProductNewModel.self){ response in
            switch response.result {
            case .success(let data):
                print("Data Savedddddd: \(data)")
//                self.allSavedData = data
                self.allSavedData = data.payload
            case .failure(let error):
                print("error \(error)")
            }
        }
    }
    
    func updateFavorite(id: Int, isFavorite: Bool) {
        let url = "http://localhost:9090/api/v1/product/\(id)"
        AF.request(url, method: .patch)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    print("Successfully updated: \(data)")
                case .failure(let error):
                    print("error \(error)")
                }
            }
    }
}
