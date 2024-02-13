import SwiftUI

public struct MovieDetails: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Movie Title")
                .titleTextStyle()
            
            Image(systemName: "film")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundStyle(Color.secondaryLight)
            
            Text("Movie Year : 2024 ")
                .subTitleTextStyle()
            
            Text("Movie Type : 2024 ")
                .subTitleTextStyle()
            
            Text("Movie Description : Something about this moview here Test")
                .bodyTextStyle()
        }
        .padding()
    }
}

#Preview {
    MovieDetails()
}
