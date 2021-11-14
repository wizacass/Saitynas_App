import Foundation

class SpecialistRowViewModel {
    let firstName: String
    let lastName: String
    let speciality: String
    
    init(_ firstName: String, _ lastName: String, _ speciality: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.speciality = speciality
    }
    
    init(_ specialist: Specialist) {
        firstName = specialist.firstName
        lastName = specialist.lastName
        speciality = specialist.speciality
    }
}
