@testable import HomeMic

import Nimble
import Quick

class StaticIconViewModelSpec: QuickSpec {
    override class func spec() {
        describe("StaticIconViewModel") {
            var uut: StaticIconViewModel?
            var mockHomeRouter: MockHomeRouter?

            beforeEach {
                uut = StaticIconViewModel()
                mockHomeRouter = MockHomeRouter()
                uut?.homeRouter = mockHomeRouter!
            }

            describe("when .popBackButtonTapped()") {
                beforeEach {
                    uut?.popBackButtonTapped()
                }

                it("calls .homeRouter.navigate(to:)") {
                    expect(mockHomeRouter?.navigateToRootWasCalled).to(beTrue())
                }
            }
        }
    }
}
