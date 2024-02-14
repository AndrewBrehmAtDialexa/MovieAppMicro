import Foundation
import CommonUI
import ApiService
import SwiftUI
class SearchNavigationViewModel {
    // MARK: - View Builders
    
    func createMovieDetailsView(movie: Movie, isFavorite: Bool) -> MovieDetails {
        return MovieDetails(movie: movie, isFavorite: isFavorite)
    }
}
