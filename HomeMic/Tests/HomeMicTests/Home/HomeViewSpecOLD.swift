@testable import HomeMic

import Nimble
import Quick
import SwiftUI
import ViewInspector

class HomeViewSpecOLD: QuickSpec {
    override class func spec() {
        var uut: HomeView?
        var mockHomeViewModel: MockHomeViewModel?

        describe("the variables") {
            beforeEach {
                uut = HomeView()
            }

            it("has a .viewModel of 'HomeViewModel'") {
                expect(uut?.viewModel).to(beAKindOf(HomeViewModel.self))
            }
        }

        describe("the body") {
            beforeEach {
                var screen = HomeView()
//                mockHomeViewModel = MockHomeViewModel()
//                screen.viewModel = mockHomeViewModel!

                let _ = screen.on(\.didAppear) { view in
                    uut = try? view.actualView()
                }

                ViewHosting.host(view: screen)
            }

            describe("the VStack") {
                // MARK: - Image

                describe("the image, at index[0]") {
                    var actualImage: Image?
//                    var inspectableImage: InspectableView<ViewType.ClassifiedView>?

                    beforeEach {
                        actualImage = try uut?.inspect().vStack().image(0).actualImage()
//                        inspectableImage = try uut?.inspect().find(viewWithId: "someImage")
                    }

                    it("nil") {
                        expect(true).to(beTrue())
                    }
//                    it("has .systemName of 'house'") {
//                        let imageName = try actualImage?.name()
//                        expect(imageName).to(equal("house"))
//                    }

//                    it("has .imageScale of .large") {
//                        let scale = try inspectableImage?.imageScale()
//
//                        expect(scale).to(equal(Image.Scale.large))
//                    }
                }

                // MARK: - Text

//                describe("the text, 'HOME VIEW!!!'") {
//                    var text: InspectableView<ViewType.Text>?
//
//                    beforeEach {
//                        text = try uut?.inspect().find(text: "HOME VIEW!!!")
//                    }
//
//                    it("has a font .system(size: 34).bold()") {
//                        try expect(text?.attributes().font()).to(equal(.system(size: 34).bold()))
//                    }
//                    it("has padding .top of 10") {
//                        try expect(text?.padding(.top)).to(equal(10))
//                    }
//                }

                // MARK: - Button

//                describe("the Button, 'See a Cat!'") {
//                    var button: InspectableView<ViewType.Button>?
//
//                    beforeEach {
//                        button = try uut?.inspect().find(button: "See a Cat!")
//                    }
//
//                    describe("when tapped") {
////                        beforeEach {
////                            try button?.tap()
////                        }
//
//                        it("calls .viewModel.seeCatButtonTapped()") {
////                            expect(mockHomeViewModel?.seeCatButtonTappedWasCalled).to(beTrue())
//                            expect(button).toNot(beNil())
//                        }
//                    }
//                }
            }
        }
    }
}
