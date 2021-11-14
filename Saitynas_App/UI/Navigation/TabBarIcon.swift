import SwiftUI

struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    
    let assignedTab: Tab
    let dimensions: Dimensions
    let systemIconName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: dimensions.width, height: dimensions.height)
                .padding(.top, 10)
            Text(assignedTab.rawValue.localized)
                .font(.footnote)
            Spacer()
        }
        .onTapGesture {
            viewRouter.selectedTab = assignedTab
        }
        .padding(.horizontal, -4)
        .foregroundColor(viewRouter.selectedTab == assignedTab ? Color.accentColor : .gray)
    }
}

struct TabBarIcon_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarIcon(
                viewRouter: ViewRouter(),
                assignedTab: .specialists,
                dimensions: Dimensions(width: 64.0, height: 64.0),
                systemIconName: "homekit"
            )
            .previewLayout(.fixed(width: 128.0, height: 128.0))
        }
    }
}
