import SwiftUI

public struct FavoritesView: View {
    @ObservedObject var viewModel = FavoritesViewModel()

    public init() {}

    public var body: some View {
        VStack {
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("FAVORITES VIEW!!!")
        }
        .padding()
    }
}
