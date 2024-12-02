
import SwiftUI

struct HomeScreen: View {

    
    var body: some View {
        NavigationView{
            ZStack {
                HomeScrollView()
                    .padding(.top, 50)
            }
            .navigationTitle("Posts")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
