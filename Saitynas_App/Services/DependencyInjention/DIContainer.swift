import Foundation

class DIContainer: ContainerProtocol, ObservableObject {
    
    @Published var communicator: Communicator?
    @Published var authenticationManager: AuthenticationManager?
}
