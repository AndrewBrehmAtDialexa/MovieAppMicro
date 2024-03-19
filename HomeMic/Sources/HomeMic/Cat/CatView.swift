//
//  SwiftUIView.swift
//
//
//  Created by Andrew Brehm on 3/4/24.
//

import SwiftUI

struct CatView: View {
    var viewModel = CatViewModel()
    
    var body: some View {
        Text("Hello, CAT!")
        Button("Show me Movie!!!") {
            viewModel.goToMovieDetails()
        }
    }
}

#Preview {
    CatView()
}
