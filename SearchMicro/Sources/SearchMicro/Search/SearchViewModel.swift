import Foundation
import Navigation

public class SearchViewModel: ObservableObject {
    let searchRouter = SearchRouter.shared
    
    func goToMovieDetails() {
        searchRouter.navigate(to: .movieDetails)
    }
}
