import CommonUI
import DataModels
import SwiftUI

public struct MovieCard: View {
    let movie: Movie
    public init(movie: Movie) {
        self.movie = movie
    }
    
    public var body: some View {
        VStack {
            AsyncImage(url: URL(string: movie.posterUrl)) { phase in
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
    }
}
