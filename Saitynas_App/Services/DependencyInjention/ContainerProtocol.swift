import Foundation

protocol ContainerProtocol {
    
    var communicator: Communicator? { get }
    var authenticationManager: AuthenticationManager? { get }
}
