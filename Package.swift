// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "swift-htmx",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
  ],
  products: [
    .library(name: "Htmx", targets: ["Htmx"]),
    .library(name: "HTTPTypesHtmx", targets: ["HTTPTypesHtmx"]),
    .library(name: "HtmlHtmx", targets: ["HtmlHtmx"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-http-types.git", from: "1.0.0"),
    .package(url: "https://github.com/alephao/swift-html.git", from: "0.5.0"),
  ],
  targets: [
    .target(name: "Htmx"),
    .testTarget(name: "HtmxTests", dependencies: ["Htmx"]),
    .target(
      name: "HTTPTypesHtmx",
      dependencies: ["Htmx", .product(name: "HTTPTypes", package: "swift-http-types")]
    ),
    .target(
      name: "HtmlHtmx",
      dependencies: ["Htmx", .product(name: "Html", package: "swift-html")]
    ),
  ]
)
