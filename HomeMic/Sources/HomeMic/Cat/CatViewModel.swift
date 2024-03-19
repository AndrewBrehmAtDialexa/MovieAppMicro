import DataModels
import Navigation

class CatViewModel {
    private let homeRouter = HomeRouter.shared

    func goToMovieDetails() {
        homeRouter.navigate(to: .someMovie(movie: Movie(title: "someTitle", year: "2000", imdbId: "asdasd", type: "lakjshd", posterUrl: "fake")))
    }
}
