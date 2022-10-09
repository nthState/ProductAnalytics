// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProductAnalytics",
    platforms: [
      .macOS(.v10_15)
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "ProductAnalytics",
            dependencies: [
              "ProductAnalyticsCore",
              .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .target(name: "ProductAnalyticsCore"),
        .testTarget(
            name: "ProductAnalyticsTests",
            dependencies: ["ProductAnalytics"]),
    ]
)
