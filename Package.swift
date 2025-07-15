// swift-tools-version:6.1

import PackageDescription

let package = Package(
    name: "WayFinder",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "WayFinder",
            targets: ["WayFinder"])
    ],
    dependencies: [
        .package(url: "https://github.com/canopas/UIPilot.git", .upToNextMajor(from: "2.0.2")),
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", exact: "0.58.2"),
        .package(url: "https://github.com/Promal-B/NavigationPilot.git", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "WayFinder",
            dependencies: [
                .product(name: "UIPilot", package: "UIPilot"),
                .product(name: "NavigationPilot", package: "NavigationPilot")
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        )

    ]
)
