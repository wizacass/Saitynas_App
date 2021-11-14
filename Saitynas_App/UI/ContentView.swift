import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var c: DIContainer
    
    @StateObject var viewRouter: ViewRouter
    
    private let pagesCount: CGFloat = 4
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    switch viewRouter.selectedTab {
                    case .specialists:
                        Text("Specialists")
                            .padding()
                        NavigationLink("Login", destination: AuthenticationView(viewModel: MessageViewModel(c)))
                    case .workplaces:
                        Text("Workplaces")
                    case .profile:
                        UserView().environmentObject(c)
                    }
                    
                    Spacer()
                    
                    if(viewRouter.isTabBarShown) {
                        TabBar(viewRouter: viewRouter, geometry: geometry)
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter()).environmentObject(DIContainer())
    }
}
