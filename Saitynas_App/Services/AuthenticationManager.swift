import Foundation

class AuthenticationManager {
    
    private var communicator: Communicator
    
    init(_ communicator: Communicator) {
        self.communicator = communicator
    }
    
    func login(_ email: String, _ password: String) {
        print("Email: \(email)")
        print("Password: \(password)")
    }
    
    func signup() {}
}
