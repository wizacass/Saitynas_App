import SwiftUI

struct HomeView: View {
    @EnvironmentObject var c: DIContainer
    
    var body: some View {
        TabView {
            SpecialistsListView(viewModel: SpecialistListViewModel(c.communicator))
                .environmentObject(c)
                .tabItem {
                    Label("Specialists", systemImage: "list.dash")
                }
                .tag(Tab.specialists)
            
            WorkplacesView()
                .tabItem {
                    Label("Workplaces", systemImage: "cross")
                }
                .tag(Tab.workplaces)
            
            SettingsView()
                .environmentObject(c)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(Tab.profile)
        }.navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(DIContainer())
    }
}
