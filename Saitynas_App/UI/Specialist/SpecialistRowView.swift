import SwiftUI

struct SpecialistRowView: View {
    var viewModel: SpecialistRowViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .imageScale(.large)
            VStack(alignment: .leading) {
                Text("\(viewModel.firstName) \(viewModel.lastName)")
                Text(viewModel.speciality).font(.caption)
            }
        }
    }
}

struct SpecialistRowView_Previews: PreviewProvider {
    private static var viewModel = SpecialistRowViewModel("John", "Smith", "GP")
    
    static var previews: some View {
        SpecialistRowView(viewModel: viewModel)
            .previewLayout(.fixed(width: 196.0, height: 48.0))
    }
}
