@testable import HomeMic

import Nimble
import Quick

class HomeViewModelSpec: QuickSpec {
    override class func spec() {
        describe("HomeViewModel") {
            var uut: HomeViewModel?
            var mockHomeRouter: MockHomeRouter?
            
            beforeEach {
                uut = HomeViewModel()
                mockHomeRouter = MockHomeRouter()
                uut?.homeRouter = mockHomeRouter!
            }
            
            describe("when .seeCatButtonTapped()") {
                beforeEach {
                    uut?.seeCatButtonTapped()
                }
                
                it("calls .homeRouter.navigate(to:)") {
                    expect(mockHomeRouter?.navigateWasCalled).to(beTrue())
                }
                
                describe("that call") {
                    it("has a destinationValue of .staticIcon") {
                        expect(mockHomeRouter?.destinationValue).to(equal(MockHomeRouter.Destination.staticIcon))
                    }
                }
            }
        }
    }
}
