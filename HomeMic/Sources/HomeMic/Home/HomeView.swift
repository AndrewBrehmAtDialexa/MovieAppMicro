import Navigation
import SwiftUI

public struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()

    public init() {}

    public var body: some View {
        VStack {
            Image(systemName: "house")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("HOME VIEW!!!")
            Button("See a Cat!") {
                viewModel.seeCatButtonTapped()
            }
        }
        .padding()
    }
}
