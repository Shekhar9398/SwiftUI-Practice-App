
import SwiftUI

struct CommentsView: View {
    @State private var commentText : String = ""
    @State var comments : [String] = ["Welcome Guys"]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white,.pink], startPoint: .top, endPoint: .bottom)
            
            VStack{
                
                TextField("Write Your Comment", text: $commentText, onCommit: {
                    //..Call function here
                    addComment()
                })
                .frame(width: 300, height: 40)
                .background(Color.white)
                .padding()
                
                
                List(comments, id: \.self){ comment in
                    Text(comment)
                }
                .scrollContentBackground(.hidden)
                
            }
        }
        .ignoresSafeArea()
    }
    
    //..Function after onCommit
    private func addComment(){
        if !commentText.isEmpty{
            comments.append(commentText)
            commentText = ""
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
