@testable import HomeMic

import Nimble
import Quick

class HomeNavigationViewModelSpec: QuickSpec {
    override class func spec() {
        describe("HomeNavigationViewModel") {
            var uut: HomeNavigationViewModel?
            
            beforeEach {
                uut = HomeNavigationViewModel()
            }
            
            describe("when .createStaticIconView()") {
                var result: StaticIconView?
                
                beforeEach {
                    result = uut?.createStaticIconView()
                }
                
                it("returns a StaticIconView") {
                    expect(result).to(beAKindOf(StaticIconView.self))
                }
            }
        }
    }
}
