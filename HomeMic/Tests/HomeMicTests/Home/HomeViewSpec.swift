@testable import HomeMic

import Nimble
import Quick
import SwiftUI
import ViewInspector

class HomeViewSpec: QuickSpec {
    override class func spec() {
        var uut: HomeView?
        // vm

        describe("the body") {
            beforeEach {
                var screen = HomeView()
                let _ = screen.on(\.didAppear) { view in
                    uut = try? view.actualView()
                }

                ViewHosting.host(view: screen)
            }
        }
    }
}
