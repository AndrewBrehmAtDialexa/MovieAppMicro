import CommonUI
import FeatureComponent
import SwiftUI

public struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    
    public init() {}
    
    public var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                    .foregroundColor(Color.secondaryLight)
                Text("Search For Movies.")
            }
            .smallTitleTextStyle()
            
            SearchBar(searchText: $viewModel.searchText, isSearching: $viewModel.isSearching)
                .frame(maxHeight: 100)
            
            VStack {
                switch viewModel.state {
                case .error:
                    // TODO: Create Error View in CommonUI Package...
                    Text("Error ! Something went wrong!")
                        .foregroundStyle(Color.red)
                    
                case .showData:
                    List {
                        ForEach(viewModel.searchMovieResults, id: \.self) { movie in
                            MovieRow(movie: movie)
                                .listRowSeparatorTint(Color.white)
                                .listRowBackground(Color.white)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
                                .id(movie.imdbId)
                                .onTapGesture {
                                    // TODO: Work on passing isFavorite here...
                                    viewModel.goToMovieDetails(movie: movie)
                                }
                        }
                    }
                    .listStyle(.plain)
                    .accessibilityIdentifier("movieListView")
                
                case .showEmpty:
                    Text("No movies found.")
                        .subTitleTextStyle()
                    
                case .loading:
                    // TODO: Create Loading View in CommonUI Package...
                    Text("Loading...")
                        .foregroundStyle(Color.secondaryLight)
                }
            }.frame(maxHeight: .infinity)
        }
        .padding()
    }
}

// MARK: - Previews

#Preview("Default") {
    SearchView()
}

#Preview("State .error") {
    var viewModel = SearchViewModel()
    viewModel.state = .error
    var view = SearchView()
    view.viewModel = viewModel
    
    return view
}

#if DEBUG
import DataModels

#Preview("State .showData") {
    let movie = Movie(title: "Batman: The Animated Series", year: "1992–1995", imdbId: "tt0103359", type: "series", posterUrl: "https://m.media-amazon.com/images/M/MV5BOTM3MTRkZjQtYjBkMy00YWE1LTkxOTQtNDQyNGY0YjYzNzAzXkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_SX300.jpg")
    
    var viewModel = SearchViewModel()
    viewModel.state = .showData
    viewModel.searchMovieResults = [movie, movie, movie, movie]
    var view = SearchView()
    view.viewModel = viewModel
    
    return view
}

#endif

#Preview("State .showEmpty") {
    var viewModel = SearchViewModel()
    viewModel.state = .showEmpty
    var view = SearchView()
    view.viewModel = viewModel
    
    return view
}

#Preview("State .loading") {
    var viewModel = SearchViewModel()
    viewModel.state = .loading
    var view = SearchView()
    view.viewModel = viewModel
    
    return view
}
