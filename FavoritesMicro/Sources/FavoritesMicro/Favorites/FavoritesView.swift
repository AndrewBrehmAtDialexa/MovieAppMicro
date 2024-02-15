import SwiftUI
import CommonUI

public struct FavoritesView: View {
    @ObservedObject var viewModel = FavoritesViewModel()

    public init() {}

    public var body: some View {
        VStack {
            if viewModel.favoriteCount <= 0 {
                Text("Oops, looks like you have no favorites yet.")
            } else {
                ForEach(viewModel.favorites, id: \.imdbId) { movie in
                        MovieRow(movie: movie)
                            .listRowSeparatorTint(Color.white)
                            .listRowBackground(Color.white)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Favorites")
        .navigationBarTitleDisplayMode(.inline)
    }
}
