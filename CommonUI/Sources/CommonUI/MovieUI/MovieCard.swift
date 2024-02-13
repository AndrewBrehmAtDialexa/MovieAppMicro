import SwiftUI

//TODO: Pass movie object to display data in this view.
public struct MovieCard: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Image(systemName: "film")
                .resizable()
                .frame(width: 120, height: 140)
                .foregroundStyle(Color.secondaryLight)
            
            Text("Movie Title")
                .bodyTextStyle()
                .frame(maxHeight: .infinity)
        }
        .frame(width: 120, height: 180)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.secondaryLight.opacity(0.4), lineWidth: 1)
        )
    }
}

#Preview {
    MovieCard()
}
