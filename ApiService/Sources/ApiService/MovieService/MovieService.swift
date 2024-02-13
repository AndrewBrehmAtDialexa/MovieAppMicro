import Combine
import Foundation

public class MovieService {
    private var cancellables: Set<AnyCancellable> = []
    
    func getMovies(bySearchTerm search: String) async throws -> [Movie]? {
        
        return try await withCheckedThrowingContinuation { continuation in
            if let url = Bundle.module.url(forResource: search.lowercased(), withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let movies = try decodeMovieSearch(fromData: data)
                    continuation.resume(returning: movies ?? [])
                } catch {
                    continuation.resume(throwing: NetworkError.decodingError)
                }
            } else {
                continuation.resume(throwing: NetworkError.badUrl)
            }
        }
    }
    
    private func decodeMovieSearch(fromData data: Data) throws -> [Movie]?  {
        guard let searchResponse = try? JSONDecoder().decode(MovieSearch.self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return searchResponse.searchResult
    }
    
    func fetchData() -> AnyPublisher<[Product], Error> {
        let url = URL(string: "https://fakestoreapi.com/products?limit=500")!
        var request = URLRequest(url: url)
        request.cachePolicy = .returnCacheDataElseLoad

        let customCache = URLCache(memoryCapacity: 20 * 1024 * 1024, diskCapacity: 100 * 1024 * 1024, diskPath: "movieCache")
        URLCache.shared = customCache

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: [Product].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
