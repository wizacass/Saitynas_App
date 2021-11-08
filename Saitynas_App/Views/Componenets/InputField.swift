import SwiftUI

struct InputField: View {
    var placeholder: String
    
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(.regularMaterial)
            .background(Color.accentColor)
            .cornerRadius(8)
    }
}

struct InputField_Previews: PreviewProvider {
    static var previews: some View {
        InputField(placeholder: "Email", text: .constant("")).previewLayout(.fixed(width: 240.0, height: 120.0))
    }
}
