import SwiftUI
import ApiService

public class UserData: ObservableObject {
    public static let shared: UserData = .init()
    
    @Published public var favoriteMovies: [Movie] = [] 

    private init() { }
}
