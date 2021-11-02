import Foundation

class Communicator {
    
    private var apiClient: ApiClient
    
    init(_ apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getMessage() {
        apiClient.get("")
    }
}
