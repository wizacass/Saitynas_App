import SwiftUI

struct HomeView: View {
    @EnvironmentObject var c: DIContainer
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    switch viewRouter.selectedTab {
                    case .specialists:
                        SpecialistsListView(viewModel: SpecialistListViewModel(c.communicator)).environmentObject(c)
                    case .workplaces:
                        WorkplacesView()
                    case .profile:
                        UserView(viewRouter: viewRouter).environmentObject(c)
                    }
                    
                    Spacer()
                    
                    TabBar(viewRouter: viewRouter, geometry: geometry)
                }                }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewRouter: ViewRouter()).environmentObject(DIContainer())
    }
}
