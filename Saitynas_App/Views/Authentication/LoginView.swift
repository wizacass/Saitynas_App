import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: LoginViewModel
    
    @State var isLogginIn: Bool = false
        
    var body: some View {
        VStack {
            Text("Welcome back!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
            
            Spacer()
            
            VStack {
                InputField(placeholder: "Email", text: $viewModel.email)
                    .textContentType(.emailAddress)
                    .padding()
                
                PasswordField(placeholder: "Password", text: $viewModel.password)
                    .padding()
            }
            
            Spacer()
            
            PrimaryButton(text: loginButtonText(), action: handleLogin)
            .disabled(isLogginIn)
            .padding()
            .alert(item: $viewModel.error) { error in
                Alert(
                    title: Text("Login error!"),
                    message: Text(error.title),
                    dismissButton: .default(Text("Ok"))
                )
            }
        }
        .padding(.top, 16)
        .padding(.bottom, 16)
    }
}

extension LoginView {
    func loginButtonText() -> String {
        return !isLogginIn ? "Log in" : "Loading..."
    }
    
    func handleLogin() {
        isLogginIn = true
        viewModel.login() {
            isLogginIn = false
            
            if viewModel.error == nil {
                dismiss()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static let data = LoginViewModel(DIContainer())
    
    static var previews: some View {
        LoginView(viewModel: data)
    }
}
