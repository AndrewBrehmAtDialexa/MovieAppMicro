import SwiftUI

public extension Color {
    init(r: Double, g: Double, b: Double) {
        self = Color(
            red: (r / 255.0),
            green: (g / 255.0),
            blue: (b / 255.0)
        )
    }
    
    static let primaryDark = Color(r: 18, g: 55, b: 42) // Dark Green - hex = #12372A
    static let secondaryDark = Color(r: 67, g: 104, b: 80)  // Darkest Green - hex = #436850
    static let primaryLight = Color(r: 251, g: 250, b: 218) // Lightest Green - hex = #FBFADA
    static let secondaryLight = Color(r: 173, g: 188, b: 159) // Light Green - hex = #ADBC9F
}

