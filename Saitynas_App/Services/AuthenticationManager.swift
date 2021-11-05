import Foundation

class AuthenticationManager {
    
    private var communicator: AccessCommunicator
    
    init(_ communicator: AccessCommunicator) {
        self.communicator = communicator
    }
    
    func login(_ email: String, _ password: String) {
        communicator.login(email, password) { tokens in
            print("JWT: \(tokens?.jwt)")
            print("Refresh: \(tokens?.refreshToken)")
        } onError: { error in
            print("Error!")
            print(error?.title)
        }
    }
    
    func signup() {}
}
