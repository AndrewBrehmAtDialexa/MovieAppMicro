import SwiftUI
import CommonUI
import FeatureView

class HomeNavigationViewModel {
    // MARK: - View Builders

    func createStyleGuideView() -> StyleGuideView {
        return StyleGuideView()
    }
    
    func movieRatingView(movie: String) -> RatingView {
        return RatingView(movie: movie)
    }
}
