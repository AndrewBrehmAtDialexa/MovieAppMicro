import SwiftUI
import CommonUI

public struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    
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
                    //TODO: Create Error View in CommonUI Package...
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
                                    //TODO: Work on passing isFavorite here...
                                    viewModel.goToMovieDetails(movie: movie, isFavorite: false)
                                }
                        }
                    }
                    .listStyle(.plain)
                    .accessibilityIdentifier("movieListView")
                
                case .showEmpty:
                    Text("No movies founds ! ")
                        .subTitleTextStyle()
                    
                case .loading:
                    //TODO: Create Loading View in CommonUI Package...
                    Text("Loading...")
                        .foregroundStyle(Color.secondaryLight)
                }
            }.frame(maxHeight: .infinity)
        }
        .padding()
    }
}
