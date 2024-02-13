@testable import HomeMic

import Nimble
import Quick
import SwiftUI
import ViewInspector

class StaticIconViewSpec: QuickSpec {
    override class func spec() {
        describe("StaticIconView") {
            var uut: StaticIconView?
            var mockViewModel: MockStaticIconViewModel?

            describe("the Observables") {}

            describe("the body") {
                beforeEach {
                    mockViewModel = MockStaticIconViewModel()
                    var screen = StaticIconView()
                    screen.viewModel = mockViewModel!

                    let _ = screen.on(\.didAppear) { view in
                        uut = try? view.actualView()
                    }

                    ViewHosting.host(view: screen)
                }

                describe("the VStack") {
                    // MARK: - Image

                    describe("the image, at index[0]") {
                        var actualImage: Image?

                        beforeEach {
                            actualImage = try uut?.inspect().vStack().image(0).actualImage()
                        }

                        it("has .systemName of 'cat'") {
                            let imageName = try actualImage?.name()
                            expect(imageName).to(equal("cat"))
                        }
                    }

                    // MARK: - Button

                    describe("the Button, 'POP TO ROOT!'") {
                        var button: InspectableView<ViewType.Button>?

                        beforeEach {
                            button = try uut?.inspect().find(button: "POP TO ROOT!")
                        }

                        describe("when tapped") {
                            beforeEach {
                                try button?.tap()
                            }

                            it("calls .viewModel.popBackButtonTapped()") {
                                expect(mockViewModel?.popBackButtonTappedWasCalled).to(beTrue())
                            }
                        }
                    }
                }
            }
        }
    }
}
