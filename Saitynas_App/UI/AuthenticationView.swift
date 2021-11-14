import SwiftUI

struct AuthenticationView: View {
    
    @EnvironmentObject var c: DIContainer
    @StateObject var viewRouter: ViewRouter
    
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
                            viewModel: LoginViewModel(c),
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
                    destination: HomeView(viewRouter: viewRouter).environmentObject(c),
                    isActive: $didLogIn
                ) { EmptyView() }
            }
        }
        .navigationBarHidden(true)
        .onAppear() {
            viewModel.container = c
            viewModel.loadMessage()
        }
    }
    
    func alertMessage(_ message: String?) -> Text? {
        guard let message = message else { return nil }
        return Text(message)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static let data = MessageViewModel(DIContainer())
    
    static var previews: some View {
        AuthenticationView(viewRouter: ViewRouter(), viewModel: data)
    }
}
