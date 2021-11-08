import Foundation

struct Error: Codable, Identifiable {
    var id: String { title }
    
    let type: Int
    let title: String
    let details: String?
}

extension Error {
    
    static func genericError() -> Error {
        return Error(type: 0, title: "something_went_wrong", details: nil)
    }
}
