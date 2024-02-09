import Navigation
import SwiftUI

class StaticIconViewModel: ObservableObject {
    var homeRouter = HomeRouter.shared

    func popBackButtonTapped() {
        homeRouter.navigateToRoot()
    }
}
