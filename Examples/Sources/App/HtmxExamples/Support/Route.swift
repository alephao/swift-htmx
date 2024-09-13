import Html
import Hummingbird

struct Route {
  let path: String
  let routerPath: RouterPath
  // HTML forms can only send GET and POST
  let formMethod: FormMethod
  let httpMethod: HTTPRequest.Method

  init(_ method: Method, _ path: String) {
    self.path = path
    self.routerPath = RouterPath(path)
    self.formMethod =
      switch method {
      case .get: .get
      case .post: .post
      }
    self.httpMethod =
      switch method {
      case .get: .get
      case .post: .post
      }
  }

  enum Method {
    case get
    case post
  }
}

// Helpers for Hummingbird
extension RouterMethods {
  @discardableResult func on(
    route: Route,
    use closure: @Sendable @escaping (Request, Context) async throws -> some ResponseGenerator
  ) -> Self {
    self.on(route.routerPath, method: route.httpMethod, use: closure)
  }

  @discardableResult func on(
    route: Route,
    use closure: @Sendable @escaping (Request) async throws -> some ResponseGenerator
  ) -> Self {
    self.on(route: route) { req, _ in try await closure(req) }
  }
}

// Helpers for Html
extension Attribute where Element == Tag.Form {
  static func action(route: Route) -> Attribute {
    return action(route.path)
  }

  static func method(route: Route) -> Attribute {
    return method(route.formMethod)
  }
}

extension Attribute where Element: HasHref {
  static func href(route: Route) -> Attribute {
    return href(route.path)
  }
}

extension Node {
  static func form(
    route: Route,
    attributes: [Attribute<Tag.Form>] = [],
    _ content: Node...
  ) -> Node {
    form(
      attributes: [
        .action(route: route),
        .method(route: route),
      ] + attributes,
      .fragment(content)
    )
  }

  static func a(
    route: Route,
    attributes: [Attribute<Tag.A>] = [],
    _ content: Node...
  ) -> Node {
    a(attributes: [.href(route: route)], .fragment(content))
  }
}
