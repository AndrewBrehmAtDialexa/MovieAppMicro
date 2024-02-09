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
                    case .staticIcon:
                        viewModel.createStaticIconView()
                    }
                }
                .onAppear { self.didAppear?(self) }
                .padding(EdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4))
                .id("mainNavStack")
        }
    }
}
