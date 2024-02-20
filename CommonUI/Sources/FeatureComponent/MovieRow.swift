import CommonUI
import DataModels
import SwiftUI

public struct MovieRow: View {
    let movie: Movie
    let url: URL
    public init?(movie: Movie) {
        self.movie = movie
        self.url = URL(string: movie.posterUrl)!
    }
    
    public var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.posterUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(4)
                } else if phase.error != nil {
                    Image(systemName: "film")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(Color.secondaryLight)
                        .cornerRadius(4)
                } else {
                    ProgressView()
                }
            }
            .padding(10)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .subTitleTextStyle()
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
                
                Text("Year : \(movie.year)")
                    .smallBodyTextStyle()
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
                Text("Type : \(movie.type)")
                    .smallBodyTextStyle()
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.secondaryLight.opacity(0.4), lineWidth: 1)
        )
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
