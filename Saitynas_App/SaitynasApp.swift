import SwiftUI

@main
struct SaitynasApp: App {
    
    @StateObject var c: DIContainer = Bootstrapper().createContainer()
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            if c.authenticationManager?.isLoggedIn ?? false {
                HomeView(viewRouter: viewRouter).environmentObject(c)
            } else {
                AuthenticationView(viewRouter: viewRouter, viewModel: MessageViewModel()).environmentObject(c)
            }
        }
    }
}
