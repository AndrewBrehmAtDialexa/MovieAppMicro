import SwiftUI
import ApiService

public struct MovieCard: View {
    let movie: Movie
    public init(movie: Movie) {
        self.movie = movie
    }
    
    public var body: some View {
        VStack {
            Image(systemName: "film")
                .resizable()
                .frame(width: 120, height: 140)
                .foregroundStyle(Color.secondaryLight)
            
            Text(movie.title)
                .bodyTextStyle()
                .frame(maxHeight: .infinity)
        }
        .frame(width: 120, height: 180)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.secondaryLight.opacity(0.4), lineWidth: 1)
        )
    }
}
