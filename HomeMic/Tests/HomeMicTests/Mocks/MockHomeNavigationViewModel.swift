@testable import HomeMic

class MockHomeNavigationViewModel: HomeNavigationViewModel {
    var createStaticIconViewWasCalled = false
    
    override func createStaticIconView() -> StaticIconView {
        createStaticIconViewWasCalled = true
        
        return super.createStaticIconView()
    }
}
