
import SwiftUI

struct PersonDetailsView: View {
    var image : String
    var text : String
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.white, .mint], startPoint: .top, endPoint: .bottom)
            
            VStack(spacing: 30) {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("\(text)")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .shadow(color: .white, radius: 20)
            }
            .frame(width: .infinity, height: 300)
            
        }
        .ignoresSafeArea()
    }
}

struct PersonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailsView(image: "person.fill", text: "Paul")
    }
}
