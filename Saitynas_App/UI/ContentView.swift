import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var c: DIContainer
    
    @StateObject var viewRouter: ViewRouter
    
    private let pagesCount: CGFloat = 4
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    Text("Home")
                case .liked:
                    Text("Liked")
                case .records:
                    Text("Records")
                case .user:
                    Text("User")
                }
                Spacer()
                
                HStack {
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/pagesCount, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .liked, width: geometry.size.width/pagesCount, height: geometry.size.height/28, systemIconName: "heart", tabName: "Liked")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .records, width: geometry.size.width/pagesCount, height: geometry.size.height/28, systemIconName: "waveform", tabName: "Records")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .user, width: geometry.size.width/pagesCount, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Account")
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(Color.offWhite.shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter()).environmentObject(DIContainer())
    }
}

struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .padding(.horizontal, -4)
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color.accentColor : .gray)
        
        
    }
}
