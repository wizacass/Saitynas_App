import Foundation

class Bootstrapper {
    
    private var apiClient: ApiClient
    private var communicator: Communicator
    
    init() {
        let apiUrl = Bundle.main.object(forInfoDictionaryKey: "apiUrl") as! String
        
        apiClient = ApiClient(apiUrl)
        communicator = Communicator(apiClient)
        
        communicator.getMessage()
    }
    
    func createContainer() -> DIContainer {
        return DIContainer()
    }
}
