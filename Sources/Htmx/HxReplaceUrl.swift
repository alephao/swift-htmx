/// https://htmx.org/attributes/hx-replace-url/
public enum HxReplaceUrl: CustomStringConvertible {
  /// replaces the fetched URL in the browser navigation bar.
  case `true`
  /// disables replacing the fetched URL if it would otherwise be replaced due to inheritance.
  case `false`
  /// A URL to be replaced into the location bar. This may be relative or absolute, as per history.replaceState().
  case url(String)

  public var description: String {
    switch self {
    case .true: "true"
    case .false: "false"
    case .url(let url): url
    }
  }
}
