import SwiftUI

struct PrimaryButton: View {
    var text: String
    
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: action ?? { }) {
            Text(text)
                .frame(minWidth: 0, maxWidth: 360)
                .padding()
                .background(Color.accentColor)
                .foregroundColor(Color.white)
                .font(.title2)
                .cornerRadius(16)
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Click me!", action: nil)
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/240.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/120.0/*@END_MENU_TOKEN@*/))
    }
}
