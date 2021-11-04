import Foundation

class Bootstrapper {
    
    private var apiClient: ApiClient
    private var communicator: Communicator
    private var authenticationManager: AuthenticationManager
    
    init() {
        let apiUrl = Bundle.main.object(forInfoDictionaryKey: "apiUrl") as! String
        
        apiClient = ApiClient(apiUrl)
        communicator = Communicator(apiClient)
        authenticationManager = AuthenticationManager(communicator)
    }
    
    func createContainer() -> ContainerProtocol {
        let container = DIContainer()
        container.communicator = communicator
        container.authenticationManager = authenticationManager
        
        return container
    }
}
