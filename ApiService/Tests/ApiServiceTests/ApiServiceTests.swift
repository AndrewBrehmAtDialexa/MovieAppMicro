import XCTest
import Combine
@testable import ApiService

final class ApiServiceTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
    var cancellables: Set<AnyCancellable> = []
    
    func testGetMovies() async {
        let movieService = MovieService()
        
        do {
            let movies = try await movieService.getMovies(bySearchTerm: "batman")
            XCTAssertNotNil(movies, "Movies should not be nil")
            // Add more assertions based on your specific requirements
        } catch {
            XCTFail("Error: \(error.localizedDescription)")
        }
    }
    
    func testFetchData() {
        let apiService = MovieService()

        let expectation = XCTestExpectation(description: "Fetch products")

        let cancellable = apiService.fetchData()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Error: \(error)")
                }
                expectation.fulfill()
            }, receiveValue: { products in
                XCTAssertFalse((products.count <= 0), "Product should not be empty")
            })

        cancellables.insert(cancellable)

        wait(for: [expectation], timeout: 5.0)
    }
}
