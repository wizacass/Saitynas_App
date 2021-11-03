import Foundation
import Alamofire

class ApiClient
{
    private let queue = DispatchQueue.global(qos: .userInitiated)
    private let decoder = JSONDecoder()
    
    private var apiUrl: String
    
    private var baseUrl: String {
        return "https://\(apiUrl)/api/v1"
    }
    
    init(_ apiUrl: String) {
        self.apiUrl = apiUrl
    }
    
    func get<T: Decodable>(
        _ endpoint: String,
        _ onSuccess: @escaping (T?) -> Void,
        _ onError: @escaping (Error?) -> Void
    ) {
        let url = "\(baseUrl)/\(endpoint)"
        let headers = createHeaders()
        
        AF.request(url, method: .get, headers: headers)
            .validate()
            .responseJSON(queue: queue) { [weak self] response in
                self?.handleResponse(response, onSuccess, onError)
            }
    }
    
    private func createHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "X-Api-Request": "true"
        ]
        
        return headers
    }
    
    private func handleResponse<T: Decodable, U>(
        _ response: DataResponse<U, AFError>,
        _ onSuccess: @escaping (T?) -> Void,
        _ onError: @escaping (Error?) -> Void
    ) {
        switch response.result {
        case .success:
            let data: T? = tryParse(response.data)
            
            DispatchQueue.main.async { onSuccess(data) }
        case .failure:
            let error: Error? = tryParse(response.data)
            
            DispatchQueue.main.async { onError(error) }
        }
    }
    
    private func tryParse<T: Decodable>(_ data: Data?) -> T? {
        guard let data = data else { return nil }
        return try? decoder.decode(T.self, from: data)
    }
}
