import Navigation
import SwiftUI

public struct HomeNavigationView: View {
    var viewModel = HomeNavigationViewModel()
    @ObservedObject var navPathWrapper = HomeRouter.shared.navPathWrapper

    public init() {}

    var didAppear: ((Self) -> Void)?

    public var body: some View {
        NavigationStack(path: $navPathWrapper.navPath) {
            HomeView()
                .navigationDestination(for: HomeRouter.Destination.self) { destination in
                    switch destination {
                    case .styleGuide:
                        viewModel.createStyleGuideView()
                    case .movieRating(let movie):
                        viewModel.movieRatingView(movie: movie)
                    }
                }
                .id("homeView")
        }
        .onAppear { self.didAppear?(self) }
        .id("mainNavStack")
    }
}

#Preview {
    HomeNavigationView()
}
