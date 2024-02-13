import Navigation
import SwiftUI
import CommonUI

public struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()

    public init() {}

    var didAppear: ((Self) -> Void)?

    public var body: some View {
        VStack {
            Image(systemName: "house")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("HOME VIEW!!!")
                .largeTitleTextStyle()
                .padding(.top, 10)
            Button("See a Cat!") {
                viewModel.seeCatButtonTapped()
            }
            Button("See style guide") {
                viewModel.seeStyleGuideButtonTapped()
            }
            .buttonStyle(GreenButton(isEnabled: true))
        }
        .onAppear { self.didAppear?(self) }
        .padding()
    }
}
