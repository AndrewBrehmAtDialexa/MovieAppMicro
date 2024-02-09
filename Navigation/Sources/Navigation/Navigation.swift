// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public class Navigation: ObservableObject {
    public static let shared: Navigation = .init()
    public var someVar: Bool
    @Published public var someString: String

    public init(someVar: Bool = true, someString: String = "START") {
        self.someVar = someVar
        self.someString = someString
    }
}
