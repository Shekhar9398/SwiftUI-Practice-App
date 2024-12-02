

import SwiftUI



struct HomeScrollView: View {
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ImagesView(apiURL: "https://api.slingacademy.com/v1/sample-data/photos")
            }
        }
    }
}


struct HomeScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScrollView()
    }
}
