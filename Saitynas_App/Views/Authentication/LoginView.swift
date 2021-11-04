import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Welcome back!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
                .padding(.top, 16)
            
            Spacer()
            
            VStack {
                InputField(placeholder: "Email", text: $viewModel.email)
                    .padding()
                
                PasswordField(placeholder: "Password", text: $viewModel.password)
                    .padding()
            }
            
            Spacer()
            
            PrimaryButton(text: "Log in", action: viewModel.login)
                .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static let data = LoginViewModel(DIContainer())
    
    static var previews: some View {
        LoginView(viewModel: data)
    }
}
