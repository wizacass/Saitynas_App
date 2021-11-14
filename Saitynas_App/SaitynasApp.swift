import SwiftUI

@main
struct SaitynasApp: App {
    
    @StateObject var c: DIContainer = Bootstrapper().createContainer()
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
//            if c.authenticationManager?.isLoggedIn ?? false {
//                HomeView().environmentObject(c)
//            } else {
//                AuthenticationView(viewModel: MessageViewModel(c))
//            }
            ContentView(viewRouter: viewRouter).environmentObject(c)
        }
    }
}
