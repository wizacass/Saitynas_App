import SwiftUI

struct SpecialistsListView: View {
    @EnvironmentObject var c: DIContainer
    
    @ObservedObject var viewModel: SpecialistListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.specialists) { specialist in
                    NavigationLink(destination: SpecialistDetailView()) {
                        SpecialistRowView(viewModel: SpecialistRowViewModel(specialist))
                    }
                }
            }
            .onAppear(perform: viewModel.loadSpecialists)
            .navigationTitle("Specialists")
        }.navigationBarHidden(true)
    }
}

struct SpecialistsListView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialistsListView(viewModel: SpecialistListViewModel.previewModel).environmentObject(DIContainer())
    }
}
