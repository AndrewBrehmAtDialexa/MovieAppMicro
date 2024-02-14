import Navigation
import SwiftUI

public struct SearchNavigationView: View {
    var viewModel = SearchNavigationViewModel()
    @ObservedObject var navPathWrapper = SearchRouter.shared.navPathWrapper
    
    public init() {}
    
    var didAppear: ((Self) -> Void)?
    
    public var body: some View {
        NavigationStack(path: $navPathWrapper.navPath) {
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
