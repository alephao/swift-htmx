// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "swift-htmx",
    products: [
        .library(name: "Htmx", targets: ["Htmx"]),
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-http-types.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "Htmx"),
        .target(name: "HTTPTypesHtmx", dependencies: ["Htmx", .product(name: "HTTPTypes", package: "swift-http-types")]),
    ]
)
