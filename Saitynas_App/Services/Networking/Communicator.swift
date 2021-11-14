import Foundation

class Communicator {
    
    private var apiClient: ApiClient
    
    init(_ apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getMessage(onSuccess: @escaping (Message?) -> Void, onError: @escaping (Error?) -> Void) {
        apiClient.get("", onSuccess, onError)
    }
    
    func getSpecialists(onSuccess: @escaping (Specialists?) -> Void, onError: @escaping (Error?) -> Void) {
        apiClient.get("/specialists", onSuccess, onError)
    }
}
