import Foundation
import SwiftUI

class MessageViewModel: ObservableObject {
    
    var container: DIContainer?
    
    @Published var message: String?
    @Published var error: Error?
    
    init() { }
    
    init(_ container: DIContainer) {
        self.container = container
    }
    
    func loadMessage() {
        container?.communicator?.getMessage() { [weak self] message in
            self?.message = message?.data.message
        } onError: { [weak self] error in
            self?.error = error
        }
    }
}
