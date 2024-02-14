import SwiftUI

public struct LargeTitleText: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundStyle(Color.primaryDark)
    }
}

public struct TitleText: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(Color.primaryDark)
    }
}

public struct SmallTitleText: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.primaryDark)
    }
}

public struct SubtitleText: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(Color.primaryDark)
    }
}

public struct BodyText: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
            .font(.body)
            .fontWeight(.regular)
            .foregroundStyle(Color.primaryDark)
    }
}
