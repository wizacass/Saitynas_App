import SwiftUI

struct SecondaryButton: View {
    var text: String
    
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: action ?? { }) {
            Text(text)
                .frame(minWidth: 0, maxWidth: 360)
                .padding()
                .foregroundColor(Color.accentColor)
                .font(.title2)
                .cornerRadius(16)
        }
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(text: "Click me!", action: nil)
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/240.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/120.0/*@END_MENU_TOKEN@*/))
    }
}
