import Foundation
import Alamofire

class ApiClient
{
    private var apiUrl: String
    
    private var baseUrl: String {
        return "https://\(apiUrl)/api/v1"
    }
    
    init(_ apiUrl: String) {
        self.apiUrl = apiUrl
    }
    
    func get(_ endpoint: String) {
        let url = "\(baseUrl)/\(endpoint)"
        let headers = createHeaders()
        
        AF.request(url, method: .get, headers: headers).responseJSON() { response in
            print(response.response?.statusCode)
            print(response.description)
        }
    }
    
    private func createHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "X-Api-Request": "true"
        ]
        
        return headers
    }
}
