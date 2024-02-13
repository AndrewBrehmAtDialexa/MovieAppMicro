@testable import HomeMic
@testable import Navigation

import Nimble
import Quick
import SwiftUI
import ViewInspector

class HomeNavigationViewSpec: QuickSpec {
    override class func spec() {
        describe("HomeNavigationView") {
            var uut: HomeNavigationView?
            var mockViewModel: MockHomeNavigationViewModel?
            var mockNavigationPathWrapper: MockNavigationPathWrapper?

            describe("the Observables") {
                beforeEach {
                    uut = HomeNavigationView()
                }

                it("has a navPathWrapper") {
                    expect(uut?.navPathWrapper).to(be(HomeRouter.shared.navPathWrapper))
                }
            }

            describe("the body") {
                beforeEach {
                    mockViewModel = MockHomeNavigationViewModel()
                    mockNavigationPathWrapper = MockNavigationPathWrapper()
                    var screen = HomeNavigationView()
                    screen.viewModel = mockViewModel!
                    screen.navPathWrapper = mockNavigationPathWrapper!

                    let _ = screen.on(\.didAppear) { view in
                        uut = try? view.actualView()
                    }

                    ViewHosting.host(view: screen)
                }

                // MARK: - NavigationStack

                describe("the NavigationStack") {
                    var mainNavStack: InspectableView<ViewType.ClassifiedView>?

                    beforeEach {
                        mainNavStack = try uut?.inspect().find(viewWithId: "mainNavStack")
                    }
                    
                    describe("the Children") {
                        describe("HomeView") {
                            var homeView: InspectableView<ViewType.ClassifiedView>?

                            beforeEach {
                                homeView = try mainNavStack?.inspect().find(viewWithId: "homeView")
                            }

                            it("is not nil") {
                                expect(homeView).toNot(beNil())
                            }
                        }
                    }
                }

                // MARK: - Navigation Destination Changes

                describe("when the .navigationDestination changes to .staticIcon") {
                    beforeEach {
                        let _ = uut!.on(\.didAppear) { _ in
                            uut?.navPathWrapper.appendToNavPath(HomeRouter.Destination.staticIcon)
                        }

                        ViewHosting.host(view: uut!)
                    }

                    it("calls .viewModel.createStaticIconView()") {
                        expect(mockViewModel?.createStaticIconViewWasCalled).to(beTrue())
                    }
                }
            }
        }
    }
}
