import Foundation

class Bootstrapper {
    
    private var apiClient: ApiClient
    private var communicator: Communicator
    
    init() {
        let apiUrl = Bundle.main.object(forInfoDictionaryKey: "apiUrl") as! String
        
        apiClient = ApiClient(apiUrl)
        communicator = Communicator(apiClient)
    }
    
    func createContainer() -> DIContainer {
        let container = DIContainer()
        container.communicator = communicator
        
        return container
    }
}
