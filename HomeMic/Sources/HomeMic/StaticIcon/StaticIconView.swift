import SwiftUI

public struct StaticIconView: View {
    @ObservedObject var viewModel = StaticIconViewModel()

    public init() {}

    var didAppear: ((Self) -> Void)?
    
    public var body: some View {
        VStack {
            Image(systemName: "cat")
            Button("POP TO ROOT!") {
                viewModel.popBackButtonTapped()
            }
        }
        .onAppear { self.didAppear?(self) }
    }
}
