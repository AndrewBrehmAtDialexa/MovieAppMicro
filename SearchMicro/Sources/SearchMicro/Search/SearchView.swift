import SwiftUI

public struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    
    public init() {}
    
    public var body: some View {
        VStack {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("SEARCH VIEW!!!")
            
            Button("Go to see movie details") {
                viewModel.goToMovieDetails()
            }
        }
        .padding()
    }
}
