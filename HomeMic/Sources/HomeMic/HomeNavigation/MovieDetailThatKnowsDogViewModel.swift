import FeatureView
import Navigation

class MovieDetailThatKnowsDogViewModel: MovieDetailsViewModel {
    var homeRouter = HomeRouter.shared

    override func favoriteIconTapped() {
        homeRouter.navigate(to: .dogView)
    }
}
