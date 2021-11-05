import SwiftUI

struct ContentView: View {
    @EnvironmentObject var c: DIContainer
    
    var body: some View {
        if c.authenticationManager?.isLoggedIn ?? false {
            UserView()
        } else {
            WelcomeView(viewModel: MessageViewModel(c))
        }
    }
}
