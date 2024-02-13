import Navigation
import SwiftUI

public struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()

    public init() {}

    var didAppear: ((Self) -> Void)?

    public var body: some View {
        VStack {
            Image(systemName: "house")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .id("someImage")
            Text("HOME VIEW!!!")
                .font(.system(size: 34).bold())
                .padding(.top, 10)
            Button("See a Cat!") {
                viewModel.seeCatButtonTapped()
            }
            id("navButton")
        }
        .onAppear { self.didAppear?(self) }
        .padding()
    }
}
