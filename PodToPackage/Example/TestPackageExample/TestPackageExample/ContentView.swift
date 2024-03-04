//
//  ContentView.swift
//  TestPackageExample
//
//  Created by Hai Nguyen on 2/29/24.
//

import SwiftUI
import PodToPackage


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Test Package Example")
            Spacer()
            PodView()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
