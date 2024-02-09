import HomeMic
import SwiftUI

public struct BottomTabView: View {
    public init() {}

    public var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "tray.and.arrow.down.fill")
                }
        }
    }
}
