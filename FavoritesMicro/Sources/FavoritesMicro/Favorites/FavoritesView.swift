import SwiftUI
import CommonUI

public struct FavoritesView: View {
    @ObservedObject var viewModel = FavoritesViewModel()

    public init() {}

    public var body: some View {
        NavigationStack {
            VStack {
                if viewModel.favoritesList.isEmpty {
                    Text("Oops, looks like you have no favorites yet.")
                } else {
                    ForEach(viewModel.favoritesList, id: \.imdbId) { movie in
                        MovieRow(movie: movie)
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            print(viewModel.favoritesList.count)
        }
    }
}
