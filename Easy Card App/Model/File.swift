import SwiftUI
import Foundation

struct File: Codable {
    let message, status: String
    let payload: Payload
    let time: String
}

struct Payload: Codable {
    let fileName: String
    let fileURL: String
    let fileType: String
    let fileSize: Int

    enum CodingKeys: String, CodingKey {
        case fileName
        case fileURL = "fileUrl"
        case fileType, fileSize
    }
}

