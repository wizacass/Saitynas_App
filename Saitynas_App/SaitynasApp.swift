import SwiftUI

@main
struct SaitynasApp: App {
    
    @StateObject var c: DIContainer = Bootstrapper().createContainer()
    
    var body: some Scene {
        WindowGroup {
            if c.authenticationManager?.isLoggedIn ?? false {
                PatientView().environmentObject(c)
            } else {
                AuthenticationView(viewModel: MessageViewModel(c))
            }
        }
    }
}
