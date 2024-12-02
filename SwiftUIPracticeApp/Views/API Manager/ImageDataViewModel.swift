import SwiftUI
import Combine

class ImageDataViewModel: ObservableObject {
    @Published var uiImages: [UIImage] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchImages(from urlString: String) {
        guard let url = URL(string: urlString) else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        isLoading = true
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                // Check if there was an error with the request
                if let error = error {
                    self.errorMessage = "Error fetching data: \(error.localizedDescription)"
                    return
                }
                
                // Validate the response
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    self.errorMessage = "Invalid response from server"
                    return
                }
                
                // Check if the data is valid
                guard let data = data else {
                    self.errorMessage = "No data returned"
                    return
                }
                
                // Decode the JSON data to `ImageData`
                do {
                    let imageData = try JSONDecoder().decode(ImageData.self, from: data)
                    
                    // Ensure photos are present
                    guard let photos = imageData.photos else {
                        self.errorMessage = "No photos found"
                        return
                    }
                    
                    // Fetch images from each photo URL
                    self.fetchImagesFromUrls(photos: photos)
                    
                } catch {
                    self.errorMessage = "Error decoding JSON: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
    
    private func fetchImagesFromUrls(photos: [Photos]) {
        for photo in photos {
            guard let urlString = photo.url, let url = URL(string: urlString) else {
                continue  // Skip if the URL is invalid
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let data = data, let image = UIImage(data: data) {
                        self.uiImages.append(image)  // Add image to the list
                    }
                }
            }.resume()
        }
    }
}
