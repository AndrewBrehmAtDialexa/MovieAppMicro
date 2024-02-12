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
            
            Button("See a Cat! is Enabled is false ") {
                viewModel.seeCatButtonTapped()
            }
            .buttonStyle(GreenButton(isEnabled: false))
            
            Button("See a Cat! with Light Green Color ") {
                viewModel.seeCatButtonTapped()
            }
            .buttonStyle(LightGreenButton())
        }
        .padding()
    }
}
