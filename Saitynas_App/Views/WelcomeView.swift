import SwiftUI

struct WelcomeView: View {
    @ObservedObject var viewModel: MessageViewModel
    
    var body: some View {
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
