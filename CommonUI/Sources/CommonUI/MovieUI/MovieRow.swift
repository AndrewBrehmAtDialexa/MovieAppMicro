import SwiftUI

//TODO: Pass movie object to display data in this view.
public struct MovieRow: View {
    public init() {}
    
    public var body: some View {
        HStack {
            Image(systemName: "film")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(Color.secondaryLight)
                .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("Movie Title")
                    .smallTitleTextStyle()
                Text("Movie year : 2024")
                    .bodyTextStyle()
                Text("Movie type : movie")
                    .bodyTextStyle()
            }
            .frame(minWidth: 150)
            .padding(.vertical)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.secondaryLight.opacity(0.4), lineWidth: 1)
        )
        .padding()
    }
}

#Preview {
    MovieRow()
}
