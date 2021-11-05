import Foundation
import Combine

class AuthenticationManager: ObservableObject  {
    
    let didChange = PassthroughSubject<AuthenticationManager,Never>()
    let willChange = PassthroughSubject<AuthenticationManager,Never>()
    
    @Published var isLoggedIn: Bool {
        didSet {
            didChange.send(self)
            print("Login state changed to \(isLoggedIn)")
        }
    }
    
    private var communicator: AccessCommunicator
    private var repository: UserTokensRepository
    
    init(_ communicator: AccessCommunicator, _ repository: UserTokensRepository) {
        self.communicator = communicator
        self.repository = repository
        
        isLoggedIn = repository.accessToken != nil
    }
    
    func login(_ email: String, _ password: String, onComplete handleLogin: @escaping (Error?) -> Void) {
        communicator.login(email, password) { [weak self] tokens in
            self?.repository.accessToken = tokens?.jwt
            self?.repository.refreshToken = tokens?.refreshToken
            self?.isLoggedIn = true
            
            print("Logged in!")
            
            handleLogin(nil)
        } onError: { error in
            handleLogin(error)
        }
    }
    
    func signup() {}
    
    func logout() {
        repository.clearAll()
        isLoggedIn = false
        print("Logged out!")
    }
}
