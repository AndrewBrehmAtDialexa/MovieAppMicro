import Combine
import Foundation

public class MovieService {
    
    func getMovies(bySearchTerm search: String) async throws -> [Movie]? {
        
        return try await withCheckedThrowingContinuation { continuation in
            if let url = Bundle.module.url(forResource: search, withExtension: "json") {
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
}
