import Foundation

class AuthenticationManager {
    
    var isLoggedIn: Bool { return repository.accessToken != nil }
    
    private var communicator: AccessCommunicator
    private var repository: UserTokensRepository
    
    init(_ communicator: AccessCommunicator, _ repository: UserTokensRepository) {
        self.communicator = communicator
        self.repository = repository
    }
    
    func login(_ email: String, _ password: String, onComplete handleLogin: @escaping (Error?) -> Void) {
        communicator.login(email, password) { [weak self] tokens in
            self?.repository.accessToken = tokens?.jwt
            self?.repository.refreshToken = tokens?.refreshToken
            handleLogin(nil)
        } onError: { error in
            handleLogin(error)
        }
    }
    
    func signup() {}
    
    func logout() {
        repository.clearAll()
    }
}
