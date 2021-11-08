import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: UIConstants.buttonMaxWidth)
            .padding()
            .foregroundColor(Color.accentColor)
            .font(.title2)
            .overlay(
                RoundedRectangle(cornerRadius: UIConstants.buttonCornerRadius)
                    .stroke(Color.accentColor, lineWidth: 2)
            )
    }
}
