import SwiftUI

struct UserView: View {
    private var authManager: AuthenticationManager?
    
    var body: some View {
        VStack {
            Text("Logged in User")
                .font(.largeTitle)
            
            Spacer()
            
            SecondaryButton(text: "Logout") {
                authManager?.logout()
                print("Loggin out!")
            }
        }.padding()
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
