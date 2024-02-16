//
//  SwiftUIView.swift
//  
//
//  Created by Hai Nguyen on 2/15/24.
//

import Foundation
import CommonUI
import ApiService
import SwiftUI

class FavoriteNavigationViewModel {
    // MARK: - View Builders
    
    func createMovieDetailsView(movie: Movie) -> MovieDetailsView {
        return MovieDetailsView(movie: movie)
    }
}
