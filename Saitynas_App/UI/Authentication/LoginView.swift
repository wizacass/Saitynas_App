import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: LoginViewModel
    
    @State var isLogginIn: Bool = false
    
    @Binding var didLogIn: Bool
    
    var body: some View {
        VStack {
            Text("login_view_title".localized)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
                .padding(.top, 16)
            
            Spacer()
            
            VStack {
                VStack {
                    InputField(
                        placeholder: "email_placeholder".localized,
                        label: "email".localized,
                        imageName: "at",
                        contentType: .emailAddress,
                        isSecure: false,
                        text: $viewModel.email
                    ).padding()
                    
                    InputField(
                        placeholder: "password_placeholder".localized,
                        label: "password".localized,
                        imageName: "lock.fill",
                        contentType: .password,
                        isSecure: false,
                        text: $viewModel.password
                    ).padding()
                }
                .shadow(color: Color.offWhite, radius: 8, x: 0, y: 0)
                
                Button(loginButtonText(), action: handleLogin)
                    .buttonStyle(PrimaryButtonStyle())
                    .disabled(isLogginIn)
                    .padding()
                    .alert(item: $viewModel.error) { error in
                        Alert(
                            title: Text(error.title),
                            message: Text(error.details ?? "generic_error"),
                            dismissButton: .default(Text("ok".localized))
                        )
                    }
            }
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(.white)
                    .shadow(color: Color.offWhite, radius: 8, x: 0, y: 0)
            )
            
            .padding()
        }
        .padding(.top, 16)
        .padding(.bottom, 48)
    }
}

extension LoginView {
    func loginButtonText() -> String {
        return "\(!isLogginIn ? "login" : "loading")".localized
    }
    
    func handleLogin() {
        isLogginIn = true
        viewModel.login() {
            isLogginIn = false
            
            if viewModel.error == nil {
                didLogIn = true
                dismiss()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static let data = LoginViewModel(DIContainer())
    
    static var previews: some View {
        LoginView(viewModel: data, didLogIn: .constant(false))
        
    }
}
