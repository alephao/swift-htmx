// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swift-htmx-examples",
  platforms: [.macOS(.v14)],
  products: [
    .executable(name: "App", targets: ["App"])
  ],
  dependencies: [
    .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.0.0"),
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.3.0"),
    .package(url: "https://github.com/pointfreeco/swift-html.git", from: "0.4.0"),
    //        .package(url: "https://github.com/alephao/swift-htmx.git", from: "0.3.0"),
    .package(name: "swift-htmx", path: "../"),
  ],
  targets: [
    .executableTarget(
      name: "App",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
        .product(name: "Hummingbird", package: "hummingbird"),
        .product(name: "Html", package: "swift-html"),
        .product(name: "Htmx", package: "swift-htmx"),
        .product(name: "HTTPTypesHtmx", package: "swift-htmx"),
        .product(name: "HtmlHtmx", package: "swift-htmx"),
      ],
      path: "Sources/App"
    )
  ]
)
