import Foundation

struct Specialist: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let speciality: String
    let address: String?
}
