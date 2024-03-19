import DataModels
import FeatureView

class HomeNavigationViewModel {
    // MARK: - View Builders

    func createStyleGuideView() -> StyleGuideView {
        return StyleGuideView()
    }

    func createCatView() -> CatView {
        return CatView()
    }

    func createSomeMovieView(movie: Movie) -> MovieDetailsView {
        return MovieDetailsView(movie: movie, viewModel: MovieDetailThatKnowsDogViewModel(movie: movie))
    }

    func createDogView() -> DogView {
        return DogView()
    }
}
