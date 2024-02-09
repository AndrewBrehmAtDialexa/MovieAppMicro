import SwiftUI

public class NavigationPathWrapper: ObservableObject {
    @Published public var navPath = NavigationPath()
    
    func appendToNavPath<V>(_ value: V) where V: Decodable, V: Encodable, V: Hashable {
        navPath.append(value)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
