@testable import HomeMic

class MockHomeNavigationViewModel: HomeNavigationViewModel {
    var createStaticIconViewWasCalled = false
    var createStyleGuideViewWasCalled = false
    
    override func createStaticIconView() -> StaticIconView {
        createStaticIconViewWasCalled = true
        
        return super.createStaticIconView()
    }
    
    override func createStyleGuideView() -> StyleGuideView {
        createStyleGuideViewWasCalled = true
        
        return super.createStyleGuideView()
    }
}
