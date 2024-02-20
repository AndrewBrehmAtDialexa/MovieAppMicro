import CommonUI
import DataModels
import SwiftUI

public struct MovieCard: View {
    let url: URL
    public init?(movie: Movie) {
        self.url = URL(string: movie.posterUrl)!
    }
    
    public var body: some View {
        VStack {
            AsyncImage(url: url) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                } else if phase.error != nil {
                    Image(systemName: "film")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(Color.secondaryLight)
                        .cornerRadius(10)
                } else {
                    ProgressView()
                }
            }
            .padding(10)
        }
        .onAppear {
            // Load and cache the image using URLSession
            let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
            URLSession.shared.dataTask(with: request) { data, response, _ in
                if let data = data, let response = response {
                    let cachedResponse = CachedURLResponse(response: response, data: data)
                    URLCache.shared.storeCachedResponse(cachedResponse, for: request)
                    print("caching: url: " + url.absoluteString)
                }
            }.resume()
        }
    }
}
