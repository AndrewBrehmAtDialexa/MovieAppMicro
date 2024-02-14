@testable import MovieAppMicro
import Nimble
import Quick

class MovieAppMicroAppSpec: QuickSpec {
    override class func spec() {
        describe("MovieAppMicroApp") {
            var uut: MovieAppMicroApp?
            
            beforeEach {
                uut = MovieAppMicroApp()
            }
            
            it("has a Passing test!") {
                expect(true).to(beTrue())
            }
            
//            it("has a Failing test!") {
//                expect(true).to(beFalse())
//            }
        }
    }
}
