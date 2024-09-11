/// https://htmx.org/attributes/hx-request/
/// The hx-request attribute allows you to configure various aspects of the request
public struct HxRequest: CustomStringConvertible {

  /// timeout - the timeout for the request, in milliseconds
  public let timeout: Int?

  /// credentials - if the request will send credentials
  public let credentials: Bool?

  /// noHeaders - strips all headers from the request
  public let noHeaders: Bool?

  public init(timeout: Int? = nil, credentials: Bool? = nil, noHeaders: Bool? = nil) {
    self.timeout = timeout
    self.credentials = credentials
    self.noHeaders = noHeaders
  }

  public var description: String {
    let vals: [String?] = [
      timeout.map({ "\"timeout\": \($0)" }),
      credentials.map({ "\"credentials\": \($0 ? "true" : "false")" }),
      noHeaders.map({ "\"noHeaders\": \($0 ? "true" : "false")" }),
    ]
    return vals.compactMap({ $0 }).joined(separator: ", ")
  }
}
