# swift-htmx-examples

This project provides examples of `swift-htmx` usage

## Getting Started

Start the server by running `swift run App` in the project root

- (swap-html)[Sources/App/HtmxExamples/SwapHandlers.swift] - Swap an element via `hx-target` and `hx-swap` attributes (using the `HtmlHtmx` library for `pointfreeco/swift-html`)
- (swap-html-oob)[Sources/App/HtmxExamples/SwapHandlers.swift] - Swap an element via `hx-swap-oob` attribute (using the `HtmlHtmx` library for `pointfreeco/swift-html`)
- (swap-http)[Sources/App/HtmxExamples/SwapHandlers.swift] - Swap an element via `HX-Retarget` and `HX-Reswap` headers (using "`HTTPTypesHtmx` for `apple/swift-http-types`)
