import SwiftUI

@main
struct MainView: App {
    
    var container: DIContainer
    
    init() {
        container =  Bootstrapper().createContainer()
    }
    
    var body: some Scene {
        WindowGroup {
            WelcomeView(viewModel: MessageViewModel(container))
        }
    }
}
