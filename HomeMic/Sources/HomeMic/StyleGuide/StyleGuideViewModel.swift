import Navigation

class StyleGuideViewModel {
    var homeRouter = HomeRouter.shared
    
    func catButtonTapped() {
        homeRouter.navigate(to: .catView)
    }
}
