// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import Navigation

public class HomeMic {
    public var someHomeVar: String
    var nav = Navigation.shared

    public init(someHomeVar: String = "SOME NEW HOME") {
        self.someHomeVar = someHomeVar
    }

    public func changeNavigationFromHome(withString newString: String) {
        nav.someString = newString
    }
}
