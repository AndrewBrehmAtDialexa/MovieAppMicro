import HomeMic
import SearchMicro
import FavoritesMicro
import SwiftUI

public struct BottomTabView: View {
    public init() {}

    public var body: some View {
        TabView {
            HomeNavigationView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            FavoritesView()
                .tabItem {
                    Label("Favs", systemImage: "heart")
                }
        }
    }
}
