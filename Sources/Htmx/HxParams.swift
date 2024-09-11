/// https://htmx.org/attributes/hx-params/
/// The hx-params attribute allows you to filter the parameters that will be submitted with an AJAX request.
public enum HxParams: CustomStringConvertible {
  /// * - Include all parameters (default)
  case all

  /// none - Include no parameters
  case none

  /// not <param-list> - Include all except the comma separated list of parameter names
  case not([String])

  /// <param-list> - Include all the comma separated list of parameter names
  case some([String])

  /// not <param-list> - Include all except the comma separated list of parameter names
  public static func not(_ val: String...) -> Self {
    .not(val)
  }

  /// <param-list> - Include all the comma separated list of parameter names
  public static func some(_ val: String...) -> Self {
    .some(val)
  }

  public var description: String {
    switch self {
    case .all: "*"
    case .none: "none"
    case .not(let paramList):
      "not " + paramList.joined(separator: ", ")
    case .some(let paramList):
      paramList.joined(separator: ", ")
    }
  }
}
