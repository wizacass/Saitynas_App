import SwiftUI

struct PasswordField: View {
    var placeholder: String
    
    @Binding var text: String
    
    var body: some View {
        SecureField(placeholder, text: $text)
            .padding()
            .background(Color("AccentColorLight"))
            .cornerRadius(8)
    }
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField(placeholder: "Password", text: .constant("")).previewLayout(.fixed(width: 240.0, height: 120.0))
    }
}
