# swift-htmx

Typed [htmx](https://htmx.org) values for swift on server

## Libraries

* Htmx: Type-safe HTMX attribute names
* HTTPTypesHtmx: support for [apple/swift-http-types](https://github.com/apple/swift-http-types)
* HtmlHtmx: support for [pointfreeco/swift-html](https://github.com/pointfreeco/swift-html)

### HtmlHtmx

If you're using [pointfreeco/swift-html], HtmlHtmx will add htmx extentions to Attributes.

```swift
import Htmx
import HtmlHtmx

func example() -> Node {
  .div(
    .button(
      attributes: [
        .hxGet("/my-endpoint"),
        .hxTarget("#myDiv"),
        .hxSwap(.outerHTML),
      ],
      .text("Swapping html via hx-swap and hx-target")
    ),
    .div(attributes: [.id("myDiv")], .text("I'm getting replaced"))
  )
}
```

### HTTPTypesHtmx

`HTTPTypesHtmx` adds extensions to `swift-http-types`'s types `HTTPField` and `HTTPField.Name`

```swift 
import Htmx
import HTTPTypesHtmx

let headers = HTTPFields([
  .hxRetarget("#myDiv"),
  .hxReswap(.outerHTML),
])
```

## Example Project

Check the example project [here](Examples)

## Installation

Add the dependency to Package.swift

```swift
dependencies: [
  .package(url: "https://github.com/alephao/swift-htmx.git", from: "0.3.0")
],
```

Add the products you want to use to the target dependencies

```swift
.target(
  name: "MyTarget",
  dependencies: [
    .product(name: "Htmx", package: "swift-htmx"),
    .product(name: "HTTPTypesHtmx", package: "swift-htmx"),
    .product(name: "HtmlHtmx", package: "swift-htmx"),
  ]
)
```
