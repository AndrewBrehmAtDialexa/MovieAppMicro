@testable import HomeMic

class MockHomeViewModel: HomeViewModel {
    var seeCatButtonTappedWasCalled = false

    override func seeCatButtonTapped() {
        seeCatButtonTappedWasCalled = true
    }
}
