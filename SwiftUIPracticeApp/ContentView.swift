
import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        ZStack{
            TabView {
                ///Mark : HomeScreen
            HomeScreen()
                    .tabItem{
                        Image(systemName: "house.fill")
                    }
                ///Mark : Person Screen
             PersonScreen()
                    .tabItem {
                        Image(systemName: "person.fill")
                    }
                ///Mark : Explore Screen
            ExploreScreen()
                    .tabItem{
                            Image(systemName: "airplane")
                                .resizable()
                    }
            }
            .accentColor(.black)
              
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
