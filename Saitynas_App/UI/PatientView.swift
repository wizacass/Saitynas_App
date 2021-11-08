import SwiftUI

struct PatientView: View {
    @EnvironmentObject var c: DIContainer
    
    var body: some View {
        TabView {
            SpecialistsListView()
                .tabItem {
                    Label("Specialists", systemImage: "list.dash")
                }
            
            SpecialistsListView()
                .tabItem {
                    Label("Workplaces", systemImage: "cross")
                }
            
            UserView().environmentObject(c)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct PatientView_Previews: PreviewProvider {
    static var previews: some View {
        PatientView().environmentObject(DIContainer())
    }
}
