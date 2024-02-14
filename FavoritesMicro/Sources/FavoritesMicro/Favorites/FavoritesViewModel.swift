import Foundation
import SwiftUI
import ApiService
import UserData

public class FavoritesViewModel: ObservableObject {
    @Published public var favoritesList: [Movie]
    
    init() {
        self.favoritesList = UserData.shared.favoriteMovies
        print(UserData.shared.favoriteMovies.first?.title ?? "N/A")
    }
}
