import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: UIConstants.buttonMaxWidth)
            .padding()
            .background(Color.accentColor)
            .foregroundColor(Color.white)
            .font(.title2)
            .cornerRadius(UIConstants.buttonCornerRadius)
            .shadow(color: Color.accentColor, radius: 8, x: 0, y: 0)
    }
}
