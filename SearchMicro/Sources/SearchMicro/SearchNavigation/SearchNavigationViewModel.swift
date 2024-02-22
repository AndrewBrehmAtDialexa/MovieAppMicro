import DataModels
import FeatureView

class SearchNavigationViewModel {
    // MARK: - View Builders

    func createSearchView() -> SearchView {
        return SearchView()
    }

    func createMovieDetailsView(movie: Movie) -> MovieDetailsView {
        return MovieDetailsView(movie: movie)
    }
}
