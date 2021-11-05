import Foundation

class AccessCommunicator {
    
    private var apiClient: ApiClient
    
    init(_ apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func login(
        _ email: String,
        _ password: String,
        onSuccess: @escaping (AccessTokens?) -> Void,
        onError: @escaping (Error?) -> Void
    ) {
        let body = [
            "email": email,
            "password": password,
        ]
        
        apiClient.post("/login", body, onSuccess, onError)
    }
    
    func signup(onSuccess: @escaping (AccessTokens?) -> Void, onError: @escaping (Error?) -> Void) {
        
    }
}
