import Foundation

class Bootstrapper {
    
    private var apiClient: ApiClient
    private var communicator: Communicator
    private var accessCommunicator: AccessCommunicator
    private var authenticationManager: AuthenticationManager
    
    init() {
        let apiUrl = Bundle.main.object(forInfoDictionaryKey: "apiUrl") as! String
        
        apiClient = ApiClient(apiUrl)
        communicator = Communicator(apiClient)
        accessCommunicator = AccessCommunicator(apiClient)
        
        authenticationManager = AuthenticationManager(accessCommunicator)
    }
    
    func createContainer() -> ContainerProtocol {
        let container = DIContainer()
        container.communicator = communicator
        container.accessCommunicator = accessCommunicator
        
        container.authenticationManager = authenticationManager
        
        return container
    }
}
