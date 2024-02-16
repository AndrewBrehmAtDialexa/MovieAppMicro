import Foundation
import SwiftUI
import ApiService
import UserData
import Combine
import Navigation

public class FavoritesViewModel: ObservableObject {
    
    @Published var userData = UserData.shared
    private let favoriteRouter = FavoriteRouter.shared

    private var cancellables: Set<AnyCancellable> = []

    init() {
        userData.$favoriteMovies
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                self.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
    var favoriteCount: Int {
        userData.favoriteMovies.count
    }
    
    var favorites : [Movie] {
        userData.favoriteMovies
    }
    
    func goToMovieDetails(movie: Movie) {
        favoriteRouter.navigate(to: .movieDetails(movie: movie, isFavorite: UserData.shared.favoriteMovies.contains(where: { $0.imdbId == movie.imdbId })))
    }
}
