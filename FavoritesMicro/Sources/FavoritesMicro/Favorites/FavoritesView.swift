import SwiftUI
import CommonUI
import FeatureComponent

public struct FavoritesView: View {
    @ObservedObject var viewModel = FavoritesViewModel()

    public init() {}

    public var body: some View {
        VStack {
            HStack {
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundStyle(Color.primaryDark)
                    .fontWeight(.bold)
                
                Text("Favorites")
                    .largeTitleTextStyle()
            }
            if viewModel.favoriteCount <= 0 {
                Text("Oops, looks like you have no favorites yet.")
            } else {
                List {
                    ForEach(viewModel.favorites, id: \.self) { movie in
                        MovieRow(movie: movie)
                            .listRowSeparatorTint(Color.white)
                            .listRowBackground(Color.white)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                            .id(movie.imdbId)
                            .onTapGesture {
                                viewModel.goToMovieDetails(movie: movie)
                            }
                        
                    }
                }
                .listStyle(.plain)
                .accessibilityIdentifier("favoriteListView")
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Favorites")
        .navigationBarTitleDisplayMode(.inline)
    }
}
