import SwiftUI
import ApiService

public class SearchRouter: ObservableObject {
    public static let shared: SearchRouter = .init()
    
    public enum Destination: Codable, Hashable {
        case movieDetails(movie: Movie, isFavorite: Bool)
    }
    
    @Published public var navPathWrapper = NavigationPathWrapper()
    
    public func navigate(to destination: Destination) {
        navPathWrapper.appendToNavPath(destination)
    }
    
    public func navigateBack() {
        navPathWrapper.navigateBack()
    }
    
    public func navigateToRoot() {
        navPathWrapper.navigateToRoot()
    }
}
