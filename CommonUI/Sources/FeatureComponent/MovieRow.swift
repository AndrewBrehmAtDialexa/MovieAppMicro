import CommonUI
import DataModels
import SwiftUI

public struct MovieRow: View {
    let movie: Movie
    public init(movie: Movie) {
        self.movie = movie
    }
    
    public var body: some View {
        HStack {
            AsyncImageViewBuilder(urlString:movie.posterUrl) { phase in
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
    }
}
