
import SwiftUI

struct PersonScreen: View {

    var persons : [String] = ["Max", "Will", "Rio", "Jack", "Harry", "Lio", "Troy", "kelley","Max", "Will", "Rio", "Jack", "Harry", "Lio", "Troy", "kelley", "Max", "Will", "Rio", "Jack", "Harry", "Lio", "Troy", "kelley"]
    
    var body: some View {
        
            NavigationView {
                List{
                    
                    ForEach(0..<persons.count, id: \.self) { index  in
                        
                        NavigationLink(destination: PersonDetailsView(image: "\(index).circle", text: "\(persons[index])") ) {
                            
                            HStack {
                                Text("\(persons[index])")
                                    .font(.title2)
                                    .bold()
                                
                                Spacer()
                                
                                Image(systemName: "\(index).circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.mint)
                                
                            }
                            .padding(10)
                            .background(LinearGradient(colors: [.mint, .white], startPoint: .leading, endPoint: .trailing))
                        }
                    }
                }
                .navigationTitle("Persons")
                .listStyle(.automatic)
                .cornerRadius(20)
                
            }
        }
}

struct PersonScreen_Previews: PreviewProvider {
    static var previews: some View {
        PersonScreen()
    }
}
