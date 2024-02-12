import Navigation
import SwiftUI
import SharedUIs

public struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    public init() {}

    public var body: some View {
        VStack {
            Image(systemName: "house")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("HOME VIEW!!!")
                .foregroundColor(.primaryDark)
            
            Button("See a Cat!") {
                viewModel.seeCatButtonTapped()
            }
            .buttonStyle(GreenButton(isEnabled: true))
            
            Button("See Style Guide ") {
                viewModel.seeStyleGuideButtonTapped()
            }
            .buttonStyle(GreenButton(isEnabled: false))
        }
        .padding()
    }
}
