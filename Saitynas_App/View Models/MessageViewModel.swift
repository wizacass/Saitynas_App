import Foundation

class MessageViewModel {
    
    var container: DIContainer
    
    var message: String
    
    init(_ container: DIContainer, _ message: String) {
        self.container = container
        self.message = message
    }
}
