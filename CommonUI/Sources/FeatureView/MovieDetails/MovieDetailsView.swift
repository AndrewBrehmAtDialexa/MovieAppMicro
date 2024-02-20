import CommonUI
import DataModels
import SwiftUI

public struct MovieDetailsView: View {
    @ObservedObject private var viewModel: MovieDetailsViewModel
    let url: URL
    public init?(movie: Movie) {
        self.viewModel = MovieDetailsViewModel(movie: movie)
        self.url = URL(string: movie.posterUrl)!
    }
    
    public var body: some View {
        VStack() {
            HStack {
                Spacer()
                    .frame(maxWidth: .infinity)
                
                Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart" )
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color.red)
                    .onTapGesture {
                        viewModel.favoriteIconTapped()
                    }
            }
            .padding()
            
            Text(viewModel.movie.title)
                .titleTextStyle()
            
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
            
            HStack {
                Text("Year : ")
                    .subTitleTextStyle()
                
                Text("\(viewModel.movie.year)")
                    .bodyTextStyle()
            }
            
            HStack {
                Text("Type : ")
                    .subTitleTextStyle()
                
                Text("\(viewModel.movie.type)")
                    .bodyTextStyle()
            }
            
            HStack {
                Text("ID : ")
                    .subTitleTextStyle()
                
                Text("\(viewModel.movie.imdbId)")
                    .bodyTextStyle()
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            viewModel.fetchFavorite()
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
