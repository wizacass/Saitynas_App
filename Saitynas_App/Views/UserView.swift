import SwiftUI

struct UserView: View {
    @EnvironmentObject var c: DIContainer
    
    var body: some View {
        VStack {
            Text("Logged in User")
                .font(.largeTitle)
            
            Spacer()
            
            SecondaryButton(text: "Logout") {
                c.authenticationManager?.logout()
            }
        }.padding()
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
