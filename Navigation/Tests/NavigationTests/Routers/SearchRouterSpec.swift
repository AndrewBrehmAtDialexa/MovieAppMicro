@testable import Navigation
import Nimble
import Quick
import SwiftUI

class SearchRouterSpec: QuickSpec {
    override class func spec() {
        var uut: SearchRouter?
        var mockNavigationPathWrapper: MockNavigationPathWrapper?
        
        describe("HomeRouter") {
            beforeEach {
                uut = SearchRouter()
                mockNavigationPathWrapper = MockNavigationPathWrapper()
                uut?.navPathWrapper = mockNavigationPathWrapper!
            }
            
            describe("navigate(to:)") {
                beforeEach {
                    uut?.navigate(to: .movieDetails)
                }
                
                it("calls .navPathWrapper.appendToNavPath()") {
                    expect(mockNavigationPathWrapper?.appendToNavPathWasCalled).to(beTrue())
                }
                
                describe("that call") {
                    it("has a valuePassed of '.movieDetails'") {
                        let passed: SearchRouter.Destination = mockNavigationPathWrapper?.valuePassed as! SearchRouter.Destination
                        expect(passed).to(equal(SearchRouter.Destination.movieDetails))
                    }
                }
            }
            
            describe("navigateBack()") {
                beforeEach {
                    uut?.navigateBack()
                }
                
                it("calls .navPathWrapper.navigateBack()") {
                    expect(mockNavigationPathWrapper?.navigateBackWasCalled).to(beTrue())
                }
            }
            
            describe("navigateToRoot()") {
                beforeEach {
                    uut?.navigateToRoot()
                }
                
                it("calls .navPathWrapper.navigateBack()") {
                    expect(mockNavigationPathWrapper?.navigateToRootWasCalled).to(beTrue())
                }
            }
        }
    }
}
