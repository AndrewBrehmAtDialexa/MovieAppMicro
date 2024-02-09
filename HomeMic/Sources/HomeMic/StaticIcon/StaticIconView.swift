import SwiftUI

public struct StaticIconView: View {
    @ObservedObject var viewModel = StaticIconViewModel()

    public init() {}

    public var body: some View {
        VStack {
            Image(systemName: "cat")
            Button("POP TO ROOT!") {
                viewModel.popBackButtonTapped()
            }
        }
    }
}
