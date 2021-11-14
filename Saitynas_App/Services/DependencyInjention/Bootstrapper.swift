import Foundation

class Bootstrapper {
    
    private var apiClient: ApiClient
    private var communicator: Communicator
    private var accessCommunicator: AccessCommunicator
    private var authenticationManager: AuthenticationManager
    private var tokensRespository: UserTokensRepository
    
    init() {
        let apiUrl = Bundle.main.object(forInfoDictionaryKey: "apiUrl") as! String
        
        let storage = KeychainStorage()
        tokensRespository = UserTokensRepository(storage)
        
        apiClient = ApiClient(apiUrl, tokensRespository)
        communicator = Communicator(apiClient)
        accessCommunicator = AccessCommunicator(apiClient)
        
        authenticationManager = AuthenticationManager(accessCommunicator, tokensRespository)
    }
    
    func createContainer() -> DIContainer {
        let container = DIContainer()
        container.communicator = communicator
        
        container.authenticationManager = authenticationManager
        
        return container
    }
}
