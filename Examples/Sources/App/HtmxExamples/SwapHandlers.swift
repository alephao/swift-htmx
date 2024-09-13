import Foundation
import HTTPTypesHtmx
import Html
import HtmlHtmx
import Htmx
import Hummingbird

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension Route {
  static let swapHtml = Route(.get, "/examples/swap-html")
  static let swapHtmlOOB = Route(.get, "/examples/swap-html-oob")
  static let swapHttp = Route(.get, "/examples/swap-http")
}

func registerSwapRoutes(router: Router<AppRequestContext>) {
  router.on(route: .swapHtml, use: swapHtmlHandler)
  router.on(route: .swapHtmlOOB, use: swapHtmlOOBHandler)
  router.on(route: .swapHttp, use: swapHttpHandler)
}

@Sendable func swapHtmlHandler(_ req: Request) -> Response {
  let timestamp = String(Date.now.timeIntervalSince1970)
  let inputId = "timestamp"
  let inputSelector = "#timestamp"
  let input = Node.input(attributes: [.id(inputId), .readonly(true), .value(timestamp)])

  if req.isHtmxRequest {
    return .html(input)
  }

  return .html(
    htmlLayout(
      .div(
        .h2("Swap via hx-swap"),
        .p(
          "This example uses hx-swap and hx-target to update the input with the server's current timestamp"
        ),
        .div(
          .button(
            attributes: [
              .hxGet(Route.swapHtml.path),
              .hxTarget(inputSelector),
              .hxSwap(.outerHTML),
            ],
            .text("Swap via hx-swap and hx-target")
          ),
          .br,
          .br,
          input
        )
      )
    )
  )
}

@Sendable func swapHtmlOOBHandler(_ req: Request) -> Response {
  let timestamp = String(Date.now.timeIntervalSince1970)
  let input = Node.input(
    attributes: [
      .id("timestamp"),
      .readonly(true),
      .value(timestamp),
      req.isHtmxRequest ? .hxSwapOob() : nil,
    ]
    .compactMap({ $0 })
  )

  if req.isHtmxRequest {
    return .html(input)
  }

  return .html(
    htmlLayout(
      .div(
        .h2("Swap via hx-swap-oob"),
        .p("This example uses hx-swap-oob to update the input with the server's current timestamp"),
        .div(
          .button(
            attributes: [
              .hxGet(Route.swapHtmlOOB.path),
              .hxSwap(.none),  // otherwise the button is removed
            ],
            .text("Swap via hx-swap-oob")
          ),
          .br,
          .br,
          input
        )
      )
    )
  )
}

@Sendable func swapHttpHandler(_ req: Request) -> Response {
  let timestamp = String(Date.now.timeIntervalSince1970)
  let inputId = "timestamp"
  let inputSelector = "#timestamp"
  let input = Node.input(
    attributes: [
      .id(inputId),
      .readonly(true),
      .value(timestamp),
    ]
    .compactMap({ $0 })
  )

  if req.isHtmxRequest {
    return .html(
      extraHeaders: HTTPFields([
        .hxRetarget(inputSelector),
        .hxReswap(.outerHTML),
      ]),
      input
    )
  }

  return .html(
    htmlLayout(
      .div(
        .h2("Swap via HX-Reswap and HX-Retarget headers"),
        .p(
          "This example uses HX-Reswap and HX-Retarget headers to update the input with the server's current timestamp"
        ),
        .div(
          .button(
            attributes: [
              .hxGet(Route.swapHtmlOOB.path),
              .hxSwap(.none),  // otherwise the button is removed
            ],
            .text("Swap via HX-Reswap and Hx-Retarget")
          ),
          .br,
          .br,
          input
        )
      )
    )
  )
}
