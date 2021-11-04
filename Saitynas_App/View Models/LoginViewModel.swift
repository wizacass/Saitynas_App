import Foundation
import SwiftUI


class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    private var authManager: AuthenticationManager?
    
    init(_ container: ContainerProtocol) {
        authManager = container.authenticationManager
    }
    
    func login() {
        authManager?.login(email, password)
    }
}
