import Foundation

struct Error: Codable, Identifiable {
    var id: String { title }

    let type: Int
    let title: String
    let details: String?
}
