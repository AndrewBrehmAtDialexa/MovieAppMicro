import Foundation
import CommonUI
import DataModels
import SwiftUI
class SearchNavigationViewModel {
    // MARK: - View Builders
    
    func createMovieDetailsView(movie: Movie) -> MovieDetailsView {
        return MovieDetailsView(movie: movie)
    }
}
