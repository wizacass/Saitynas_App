import SwiftUI

struct AuthenticationView: View {
    @ObservedObject var viewModel: MessageViewModel
    
    @State var isLoginShown: Bool = false
    @State var isSignupShown: Bool = false
    
    @State var didLogIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("app_title".localized)
                    .font(.largeTitle)
                    .padding()
                
                Text(viewModel.message ?? "loading".localized)
                    .onAppear(perform: viewModel.loadMessage)
                    .padding()
                    .alert(item: $viewModel.error) { error in
                        Alert(
                            title: Text(error.title),
                            message: alertMessage(error.details),
                            dismissButton: .default(Text("ok".localized))
                        )
                    }
                
                Spacer()
                
                VStack {
                    Button("login".localized) {
                        isLoginShown = true
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.bottom, 8)
                    .sheet(isPresented: $isLoginShown) {
                        LoginView(
                            viewModel: LoginViewModel(viewModel.container),
                            didLogIn: $didLogIn
                        )
                    }
                    
                    Button("signup".localized) {
                        isSignupShown = true
                    }
                    .buttonStyle(SecondaryButtonStyle())
                    .sheet(isPresented: $isSignupShown) {
                        SignupView()
                    }
                }.padding()
                
                NavigationLink(
                    destination: UserView().environmentObject(viewModel.container),
                    isActive: $didLogIn
                ) { EmptyView() }
            }
        }.navigationBarHidden(true)
    }
    
    func alertMessage(_ message: String?) -> Text? {
        guard let message = message else { return nil }
        return Text(message)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static let data = MessageViewModel(DIContainer())
    
    static var previews: some View {
        AuthenticationView(viewModel: data)
    }
}
