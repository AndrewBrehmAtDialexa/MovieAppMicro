@testable import HomeMic

class MockStaticIconViewModel: StaticIconViewModel {
    var popBackButtonTappedWasCalled = false

    override func popBackButtonTapped() {
        popBackButtonTappedWasCalled = true
    }
}
