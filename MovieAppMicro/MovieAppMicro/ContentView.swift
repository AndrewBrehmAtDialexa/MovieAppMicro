//
//  ContentView.swift
//  MovieAppMicro
//
//  Created by Andrew Brehm on 2/8/24.
//

import HomeMic
import Navigation
import SwiftUI

struct ContentView: View {
    @ObservedObject var navigation = Navigation.shared
    var homeView = HomeMic()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! \(navigation.someString)")
            Text("HOME: \(homeView.someHomeVar)")

            Button("CHANGE STRING") {
                homeView.changeNavigationFromHome(withString: "A NEW STRING")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
