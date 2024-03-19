import Combine
import DataModels
import SwiftUI
import UserData

open class MovieDetailsViewModel: ObservableObject {
    private let userData = UserData.shared
    @Published var isFavorite = false
    @Published var movie: Movie
    
    private var cancellables: Set<AnyCancellable> = []
    
    public init(movie: Movie) {
        self.movie = movie
    }
    
    func fetchFavorite() {
        isFavorite = userData.isFavorite(movie: movie)
    }
    
    open func favoriteIconTapped() {
        isFavorite = userData.updateFavirateStatus(on: movie)
    }
}
