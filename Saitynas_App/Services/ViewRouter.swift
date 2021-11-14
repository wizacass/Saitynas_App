import Foundation

class ViewRouter: ObservableObject {
    
    @Published var selectedTab: Tab = .specialists
    @Published var isTabBarShown = true
}
