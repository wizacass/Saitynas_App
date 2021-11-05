import SwiftUI

@main
struct MainView: App {
    
    var container: ContainerProtocol
    
    private var isLoggedIn: Bool
    
    init() {
        container =  Bootstrapper().createContainer()
        
        isLoggedIn = container.authenticationManager?.isLoggedIn ?? false
    }
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                UserView()
            } else {
                let viewModel = MessageViewModel(container)
                WelcomeView(viewModel: viewModel)
            }
        }
    }
}
