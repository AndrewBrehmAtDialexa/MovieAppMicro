import SwiftUI
import ApiService
import UserData

public struct MovieDetails: View {
    let movie: Movie
    @State private var isFavorite: Bool
    
    public init(movie: Movie, isFavorite: Bool) {
        self.movie = movie
        self.isFavorite = isFavorite
    }
    
    public var body: some View {
        VStack() {
            HStack {
                Spacer()
                    .frame(maxWidth: .infinity)
                
                Image(systemName: isFavorite ? "heart.fill" : "heart" )
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color.red)
                    .onTapGesture {
                        if isFavorite {
                            UserData.shared.favoriteMovies.removeAll(where: { $0.imdbId == self.movie.imdbId })
                        } else {
                            UserData.shared.favoriteMovies.append(self.movie)
                        }
                        isFavorite = !isFavorite // toggle favorite button
                    }
            }
            .padding()
            
            Text(movie.title)
                .titleTextStyle()
            
            AsyncImage(url: URL(string: movie.posterUrl)) { phase in
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
                
                Text("\(movie.year)")
                    .bodyTextStyle()
            }
            
            
            
            HStack {
                Text("Type : ")
                    .subTitleTextStyle()
                
                Text("\(movie.type)")
                    .bodyTextStyle()
            }
            
            HStack {
                Text("ID : ")
                    .subTitleTextStyle()
                
                Text("\(movie.imdbId)")
                    .bodyTextStyle()
            }
            
            Spacer()
        } .padding()
    }
}
