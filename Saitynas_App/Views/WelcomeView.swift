import SwiftUI

struct WelcomeView: View {
    @ObservedObject var viewModel: MessageViewModel
    
    @State var isLoginShown: Bool = false
    @State var isSignupShown: Bool = false
    
    var body: some View {
        VStack {
            Text("Saitynas App")
                .font(.largeTitle)
                .padding()
            
            Text(viewModel.message ?? "Loading...")
                .onAppear(perform: viewModel.loadMessage)
                .padding()
                .alert(item: $viewModel.error) { error in
                    Alert(
                        title: Text(error.title),
                        message:alertMessage(error.details),
                        dismissButton: .default(Text("Ok"))
                    )
                }
            
            Spacer()
            
            VStack {
                PrimaryButton(text: "Log in") {
                    isLoginShown = true
                }.sheet(isPresented: $isLoginShown) {
                   LoginView()
                }
                
                SecondaryButton(text: "Sign up") {
                    isSignupShown = true
                }.sheet(isPresented: $isSignupShown) {
                    SignupView()
                 }
            }.padding()
        }
    }
    
    func alertMessage(_ message: String?) -> Text? {
        guard let message = message else { return nil }
        return Text(message)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let data = MessageViewModel(DIContainer())
    
    static var previews: some View {
        WelcomeView(viewModel: data)
    }
}
