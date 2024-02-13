@testable import HomeMic

class MockHomeViewModel: HomeViewModel {
    var seeCatButtonTappedWasCalled = false
    var seeStyleGuideButtonTappedWasCalled = false

    override func seeCatButtonTapped() {
        seeCatButtonTappedWasCalled = true
    }

    override func seeStyleGuideButtonTapped() {
        seeStyleGuideButtonTappedWasCalled = true
    }
}
