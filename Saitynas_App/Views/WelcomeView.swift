import SwiftUI

struct WelcomeView: View {
    let viewModel: MessageViewModel
    
    var body: some View {
        Text(viewModel.message)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let data = MessageViewModel(DIContainer(), "Hello!")
    
    static var previews: some View {
        WelcomeView(viewModel: data)
    }
}
