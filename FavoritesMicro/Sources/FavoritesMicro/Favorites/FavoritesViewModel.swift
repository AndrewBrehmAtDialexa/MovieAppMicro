import Foundation
import SwiftUI
import ApiService
import UserData
import Combine

public class FavoritesViewModel: ObservableObject {
    
    @Published var favoriteMovies = UserData.shared
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        favoriteMovies.$favoriteMovies
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                guard let self = self else { return }
                self.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
    var favoriteCount: Int {
        favoriteMovies.favoriteMovies.count
    }
    
    var favorites : [Movie] {
        favoriteMovies.favoriteMovies
    }
    
}
