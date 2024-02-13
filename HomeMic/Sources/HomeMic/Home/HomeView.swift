import Navigation
import SwiftUI
import CommonUI

public struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()

    public init() {}

    public var body: some View {
        VStack {
            Image(systemName: "house")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("HOME VIEW!!!")
                .largeTitleTextStyle()
            Button("See a Cat!") {
                viewModel.seeCatButtonTapped()
            }
            Button("See style guide") {
                viewModel.seeStyleGuideButtonTapped()
            }.buttonStyle(GreenButton(isEnabled: true))
        }
        .padding()
    }
}
