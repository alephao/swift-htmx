/// https://htmx.org/attributes/hx-push-url/
public enum HxPushUrl: CustomStringConvertible {
  /// pushes the fetched URL into history.
  case `true`
  /// disables pushing the fetched URL if it would otherwise be pushed due to inheritance or hx-boost.
  case `false`
  /// A URL to be pushed into the location bar. This may be relative or absolute, as per history.pushState().
  case url(String)

  public var description: String {
    switch self {
    case .true: "true"
    case .false: "false"
    case .url(let url): url
    }
  }
}
