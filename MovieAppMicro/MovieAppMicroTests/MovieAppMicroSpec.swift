@testable import MovieAppMicro
import Nimble
import Quick

class MovieAppMicro: QuickSpec {
    override class func spec() {
        describe("MovieAppMicro") {
            var uut: MovieAppMicro?
            
            beforeEach {
                uut = MovieAppMicro()
            }
            
            it("has a Passing test!") {
                expect(true).to(beTrue())
            }
            
        }
    }
}
