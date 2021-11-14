import SwiftUI

struct WorkplacesView: View {
    var body: some View {
        NavigationView {
            Text("Workplace list")
        }
        .navigationTitle("Workplaces")
    }
}

struct WorkplacesView_Previews: PreviewProvider {
    static var previews: some View {
        WorkplacesView()
    }
}
