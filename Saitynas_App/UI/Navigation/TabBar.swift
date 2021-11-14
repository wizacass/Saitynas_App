import SwiftUI

struct TabBar: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var geometry: GeometryProxy
    
    private let pagesCount: CGFloat = 3
    
    var body: some View {
        HStack {
            TabBarIcon(
                viewRouter: viewRouter,
                assignedTab: .specialists,
                dimensions: calculateDimensions(geometry),
                systemIconName: "list.dash"
            )
            
            TabBarIcon(
                viewRouter: viewRouter,
                assignedTab: .workplaces,
                dimensions: calculateDimensions(geometry),
                systemIconName: "cross"
            )
            
            TabBarIcon(
                viewRouter: viewRouter,
                assignedTab: .profile,
                dimensions: calculateDimensions(geometry),
                systemIconName: "person"
            )
        }
        .frame(width: geometry.size.width, height: geometry.size.height/8)
        .background(Color.offWhite.shadow(radius: 2))
    }
}

extension TabBar {
    private func calculateDimensions(_ geometry: GeometryProxy) -> Dimensions {
        return Dimensions(
            width: geometry.size.width / pagesCount,
            height: geometry.size.height / 36
        )
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            TabBar(viewRouter: ViewRouter(), geometry: geometry)
        }
    }
}
