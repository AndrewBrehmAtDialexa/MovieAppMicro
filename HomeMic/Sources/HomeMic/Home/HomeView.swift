import SwiftUI

public struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()

    public init() {}

    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("HOME VIEW!!!")
        }
        .padding()
    }
}
