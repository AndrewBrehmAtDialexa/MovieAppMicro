// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonUI",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CommonUI",
            targets: ["CommonUI", "FeatureComponent", "FeatureView"]),
    ],
    dependencies: [
        .package(path: "UserData"),
        .package(path: "DataModels")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CommonUI",
            dependencies: ["UserData", "DataModels"]),
        .target(
            name: "FeatureComponent",
            dependencies: ["CommonUI"]
        ),
        .target(
            name: "FeatureView",
            dependencies: ["CommonUI"]
        ),
        .testTarget(
            name: "CommonUITests",
            dependencies: ["CommonUI"]),
    ]
)
