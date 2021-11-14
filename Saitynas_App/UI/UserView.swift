import SwiftUI

struct UserView: View {
    @EnvironmentObject var c: DIContainer
    
    @State var didLogOut: Bool = false
    
    var body: some View {
        NavigationView {
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
                    destination: AuthenticationView(viewModel: MessageViewModel(c)),
                    isActive: $didLogOut
                ) { EmptyView() }
                
            }.padding()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView().environmentObject(DIContainer())
    }
}
