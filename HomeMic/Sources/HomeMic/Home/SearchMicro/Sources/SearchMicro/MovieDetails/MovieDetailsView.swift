//
//  SwiftUIView.swift
//  
//
//  Created by Lee McCormick on 2/12/24.
//

import SwiftUI

struct MovieDetailsView: View {
    var body: some View {
        VStack {
            Text("Movie Name")
                .font(.largeTitle)
            Image(systemName: "film")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.green)
            Text("Learn iOS Development to build th movie app, micro app while waiting to get laptop....")
        }
    }
}

#Preview {
    MovieDetailsView()
}
