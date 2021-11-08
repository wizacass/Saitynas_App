import SwiftUI

struct InputField: View {
    var placeholder: String
    var label: String
    var imageName: String
    var contentType: UITextContentType?
    var isSecure: Bool
    
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            
            HStack {
                Image(systemName: imageName)
                    .foregroundColor(Color.accentColor)
                
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .textContentType(contentType)
                } else {
                    TextField(placeholder, text: $text)
                        .textContentType(contentType)
                       
                }
                
            }.padding()
                .background(.regularMaterial)
                .background(Color.accentColor)
                .cornerRadius(16)
        }
    }
}

struct InputField_Previews: PreviewProvider {
    static var previews: some View {
        InputField(
            placeholder: "email@example.com",
            label: "Email",
            imageName: "at",
            isSecure: false,
            text: .constant("")
        ).previewLayout(.fixed(width: 240.0, height: 120.0))
    }
}
