import Foundation

class SpecialistListViewModel: ObservableObject {
    
    let communicator: Communicator?
    
    @Published var specialists: [Specialist] = []
    @Published var error: Error?
    
    init(_ communicator: Communicator?) {
        self.communicator = communicator
    }
    
    func loadSpecialists() {
        communicator?.getSpecialists() { [weak self] specialists in
            print("Specialists received!")
            
            DispatchQueue.main.async {
                guard let specialists = specialists else {
                    self?.error = Error.genericError()
                    return
                }
                
                self?.specialists = specialists.data
            }
        } onError: { [weak self] error in
            DispatchQueue.main.async {
                self?.error = error
            }
            
            print("Get Specialists error!")
            print(error?.title)
            print(error?.details)
        }
    }
}

extension SpecialistListViewModel {
    static var previewModel: SpecialistListViewModel {
        let specialists = [
            Specialist(id: 1, firstName: "John", lastName: "Smith", speciality: "Doctor", address: nil),
            Specialist(id: 2, firstName: "Test", lastName: "Doctor", speciality: "Surgeon", address: nil),
            Specialist(id: 3, firstName: "Dr.", lastName: "House", speciality: "Doctor", address: nil)
        ]
        
        let viewModel = SpecialistListViewModel(nil)
        viewModel.specialists = specialists
        
        return viewModel
    }
}
