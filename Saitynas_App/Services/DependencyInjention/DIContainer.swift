import Foundation

class DIContainer: ContainerProtocol {
    
    var communicator: Communicator?
    var accessCommunicator: AccessCommunicator?
    var authenticationManager: AuthenticationManager?
}
