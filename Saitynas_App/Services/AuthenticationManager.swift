import Foundation

class AuthenticationManager {
    
    private var communicator: AccessCommunicator
    
    init(_ communicator: AccessCommunicator) {
        self.communicator = communicator
    }
    
    func login(_ email: String, _ password: String, onComplete handleLogin: @escaping () -> Void) {
        communicator.login(email, password) { tokens in
            print("JWT: \(tokens?.jwt)")
            print("Refresh: \(tokens?.refreshToken)")
            handleLogin()
        } onError: { error in
            print("Error!")
            print(error?.title)
            handleLogin()
        }
    }
    
    func signup() {}
}
