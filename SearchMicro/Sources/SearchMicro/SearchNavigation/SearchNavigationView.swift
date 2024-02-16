import Navigation
import SwiftUI
import FavoritesMicro

public struct SearchNavigationView: View {
    var viewModel = SearchNavigationViewModel()
    @ObservedObject var navPathWrapper = SearchRouter.shared.navPathWrapper
    let isFavoriteView: Bool
    public init(isFavoriteView: Bool = false) {
        self.isFavoriteView = isFavoriteView
    }
    
    var didAppear: ((Self) -> Void)?
    
    @ViewBuilder
    public var body: some View {
        NavigationStack(path: $navPathWrapper.navPath) {
            if isFavoriteView {
                FavoritesView()
                    .navigationDestination(for: SearchRouter.Destination.self) { destination in
                        switch destination {
                        case .movieDetails(let movie, let isFavorite):
                            viewModel.createMovieDetailsView(movie: movie, isFavorite: isFavorite)
                        }
                    }
                    .onAppear {
                        self.didAppear?(self) }
                    .padding(5)
                    .id("favoriteMainNavStack")
            }
            else {
                SearchView()
                    .navigationDestination(for: SearchRouter.Destination.self) { destination in
                        switch destination {
                        case .movieDetails(let movie, let isFavorite):
                            viewModel.createMovieDetailsView(movie: movie, isFavorite: isFavorite)
                        }
                    }
                    .onAppear {
                        self.didAppear?(self) }
                    .padding(5)
                    .id("searchMainNavStack")
            }
        }
    }
}
