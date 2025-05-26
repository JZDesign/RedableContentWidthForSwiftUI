// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RedableContentWidthForSwiftUI",
    platforms: [.iOS(.v14), .macOS(.v10_15), .tvOS(.v15), .watchOS(.v10), .visionOS(.v1)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RedableContentWidthForSwiftUI",
            targets: ["RedableContentWidthForSwiftUI"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "RedableContentWidthForSwiftUI"),
        .testTarget(
            name: "RedableContentWidthForSwiftUITests",
            dependencies: ["RedableContentWidthForSwiftUI"]
        ),
    ]
)
