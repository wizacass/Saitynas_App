import Foundation

protocol ContainerProtocol {
    
    var communicator: Communicator? { get }
    var accessCommunicator: AccessCommunicator? { get }
    var authenticationManager: AuthenticationManager? { get }
}
