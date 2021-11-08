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
                
                SecondaryButton(text: "Logout") {
                    c.authenticationManager?.logout()
                    didLogOut = true
                }
                
                NavigationLink(
                    destination: AuthenticationView(viewModel: MessageViewModel(c)),
                    isActive: $didLogOut
                ) { EmptyView() }
                
            }.padding()
        }.navigationBarHidden(true)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView().environmentObject(DIContainer())
    }
}
