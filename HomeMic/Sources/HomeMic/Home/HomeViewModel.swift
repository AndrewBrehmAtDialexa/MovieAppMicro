import Foundation
import Navigation

public class HomeViewModel: ObservableObject {
    var homeRouter = HomeRouter.shared

    func seeCatButtonTapped() {
        homeRouter.navigate(to: .staticIcon)
    }
}
