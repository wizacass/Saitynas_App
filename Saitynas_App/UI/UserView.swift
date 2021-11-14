import SwiftUI

struct UserView: View {
    @EnvironmentObject var c: DIContainer
    @StateObject var viewRouter: ViewRouter
    
    @State var didLogOut: Bool = false
    
    var body: some View {
        VStack {
            Text("Logged in User")
                .font(.largeTitle)
            
            Spacer()
            
            Button("Logout") {
                c.authenticationManager?.logout()
                didLogOut = true
            }
            .buttonStyle(SecondaryButtonStyle())
            
            NavigationLink(
                destination: AuthenticationView(viewRouter: viewRouter, viewModel: MessageViewModel()).environmentObject(c),
                isActive: $didLogOut
            ) { EmptyView() }
            
        }.padding()
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewRouter: ViewRouter()).environmentObject(DIContainer())
    }
}
