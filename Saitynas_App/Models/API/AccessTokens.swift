import Foundation

struct AccessTokens : Codable {
    let jwt: String
    let refreshToken: String
}
