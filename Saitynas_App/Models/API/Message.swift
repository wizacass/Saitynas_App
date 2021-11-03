import Foundation

struct Message: Codable {
    let meta: Meta
    let data: MessageData
}

struct MessageData: Codable {
    let message: String
}
