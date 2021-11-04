import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("Welcome back!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
            
            Spacer()
            
            VStack {
                InputField(placeholder: "Email", text: $email)
                    .padding()
                
                PasswordField(placeholder: "Password", text: $password)
                    .padding()
            }
            
            Spacer()
            
            PrimaryButton(text: "Log in") {
                print("Email: \(email)")
                print("Password: \(password)")
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
