//
//  SwiftUIView.swift
//  
//
//  Created by Hai Nguyen on 3/1/24.
//

import SwiftUI

public struct RatingView: View {

    var movie: String
    @State var rating: Int = Int.random(in: 1...5)
    
    public init(movie: String) {
        self.movie = movie
    }

    public var body: some View {
        
        Text(movie)
            .titleTextStyle()
        
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        // Set the rating when a star is tapped
                        self.rating = index
                    }
            }
        }
        .font(.title)
    }
}

