//
//  SwiftUIView.swift
//  
//
//  Created by Hai Nguyen on 2/15/24.
//

import Navigation
import SwiftUI

public struct FavoriteNavigationView: View {
    var viewModel = FavoriteNavigationViewModel()
    @ObservedObject var navPathWrapper = FavoriteRouter.shared.navPathWrapper
    
    public init() {}
    
    var didAppear: ((Self) -> Void)?
    
    public var body: some View {
        NavigationStack(path: $navPathWrapper.navPath) {
            FavoritesView()
                .navigationDestination(for: FavoriteRouter.Destination.self) { destination in
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
    }
}
