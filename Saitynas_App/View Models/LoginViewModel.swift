import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var error: Error?
    
    private var authManager: AuthenticationManager?
    
    init(_ container: ContainerProtocol) {
        authManager = container.authenticationManager
    }
    
    func login(onComplete handleLogin: @escaping () -> Void) {
        // TODO: - Check email && password not empty
        
        authManager?.login(email, password) { [weak self] error in
            self?.error = error
            handleLogin()
        }
    }
}
