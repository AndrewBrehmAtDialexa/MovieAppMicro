import SwiftUI
import DataModels
import UserData

public struct MovieDetailsView: View {
    @ObservedObject private var viewModel: MovieDetailsViewModel
    
    public init(movie: Movie) {
        self.viewModel = MovieDetailsViewModel(movie: movie)
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
            
            AsyncImage(url: URL(string: viewModel.movie.posterUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 180, height: 250)
                        .cornerRadius(10)
                } else if phase.error != nil {
                    Image(systemName: "film")
                        .resizable()
                        .frame(width: 180, height: 250)
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
    }
}
