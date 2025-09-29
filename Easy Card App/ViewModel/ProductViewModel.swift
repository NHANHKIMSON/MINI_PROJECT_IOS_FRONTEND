import SwiftUI
import Alamofire
import Foundation

func uploadfile(image : Data,completed : @escaping(File?)->Void)  {
    let url = "http://localhost:8080/api/v1/file/upload"
    let headers  : HTTPHeaders = ["Content-Type": "multipart/form-data"]
    
    AF.upload(multipartFormData: { multipartFormData in
        multipartFormData.append(image, withName: "file",fileName: ".png",mimeType: "Image/*")
        
    }, to: url,headers: headers).validate().responseDecodable(of: File.self) { response in
        switch response.result{
        case .success(let file):
            completed(file)
        case .failure(let error):
            completed(nil)
            print("error")
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
    let url = "http://localhost:8080/api/v1/product"
    
    let productDetail = ProductDetail(condition: condition, brand: brand, model: model, color: color, year: year, size: size, type: type, description: description)
    let userInput = ProductModel(name: name, imagesURL: imagesURL, isFavorite: false, categoryID: categoryId, productDetail: productDetail )
    
    AF.request(url, method: .post, parameters:  userInput, encoder: JSONParameterEncoder.default)
        .validate()
        .responseData { response in
            switch response.result {
            case .success(let data):
                print( "success")
                print(data)
            case .failure(_):
                print("Error")
        }
    }
}
