import SwiftUI

@main
struct MainView: App {
    
    @StateObject var container: DIContainer = Bootstrapper().createContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(container)
        }
    }
}
