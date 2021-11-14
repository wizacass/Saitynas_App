import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var c: DIContainer
    
    var body: some View {
        NavigationView {
            UserView()
                .environmentObject(c)
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
