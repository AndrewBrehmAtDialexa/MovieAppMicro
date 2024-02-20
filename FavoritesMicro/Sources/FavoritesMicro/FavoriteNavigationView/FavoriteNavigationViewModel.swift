import Foundation
import CommonUI
import DataModels
import FeatureView
import SwiftUI

class FavoriteNavigationViewModel {
    // MARK: - View Builders
    
    func createMovieDetailsView(movie: Movie) -> MovieDetailsView {
        return MovieDetailsView(movie: movie)
    }
}
