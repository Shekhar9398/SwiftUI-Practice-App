import SwiftUI

struct ImagesView: View {
    
    @State private var buttonClick = false
    @State private var likeCount = 0
    @State private var dislikeCount = 0
    @State private var commentsCount = 0
    @State private var showSheet = false
    @State private var popView = false
    
    @StateObject private var viewModel = ImageDataViewModel()
    let apiURL: String
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()  // Show a loading indicator while fetching
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)  // Display any error messages
                    .foregroundColor(.red)
            } else {
                //..Images from Server
                ForEach(viewModel.uiImages, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 300)
                    
                    
                    //..Users Feedback Tab
                    HStack(spacing: 10){
                        //..Like
                        VStack {
                            Text("\(likeCount)")
                            
                            Button{
                                buttonClick.toggle()
                                likeCount += 1
                                
                            } label: {
                                Image(systemName: "hand.thumbsup")
                                Text("Like")
                            }
                        }
                        //..Dislike
                        VStack{
                            Text("\(dislikeCount)")
                            
                            Button{
                                buttonClick.toggle()
                                dislikeCount += 1
                            } label: {
                                Image(systemName: "hand.thumbsdown")
                                Text("Dislike")
                            }
                        }
                        //..Comments
                        VStack{
                            Text("")
                            
                            Button {
                                showSheet.toggle()
                            } label: {
                                Image(systemName: "message")
                                Text("Comments")
                            }
                            .sheet(isPresented: $showSheet) {
                                CommentsView()
                            }
                            
                        }
                        
                        //..Share
                        VStack{
                            Text("")
                            
                            Button{
                                popView.toggle()
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                                Text("Share")
                            }
                            .sheet(isPresented: $popView) {
                                ShareView()
                            }
                        }
                    }
                    .foregroundColor(.mint)
                    .padding()
                    
                }
            }
        }
        
        .onAppear {
            viewModel.fetchImages(from: apiURL)  // Trigger the API fetch on view load
        }
    }
}
