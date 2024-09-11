public enum Attribute {
  public struct Name: ExpressibleByStringLiteral {
    public let description: String

    public typealias StringLiteralType = String
    public init(stringLiteral: String) {
      self.description = stringLiteral
    }
  }
}

public enum HxParams: CustomStringConvertible {
  case all
  case none
  case not([String])
  case some([String])

  public static func not(_ val: String...) -> Self {
    .not(val)
  }

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

public struct HxRequest: CustomStringConvertible {
  public let timeout: Int?
  public let credentials: Bool?
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

extension Attribute.Name {
  /// issues a GET to the specified URL
  public static let hxGet: Self = "hx-get"
  /// issues a POST to the specified URL
  public static let hxPost: Self = "hx-post"
  /// push a URL into the browser location bar to create history
  public static let hxPushUrl: Self = "hx-push-url"
  /// select content to swap in from a response
  public static let hxSelect: Self = "hx-select"
  /// select content to swap in from a response, somewhere other than the target (out of band)
  public static let hxSelectOob: Self = "hx-select-oob"
  /// controls how content will swap in (outerHTML, beforeend, afterend, …)
  public static let hxSwap: Self = "hx-swap"
  /// mark element to swap in from a response (out of band)
  public static let hxSwapOob: Self = "hx-swap-oob"
  /// specifies the target element to be swapped
  public static let hxTarget: Self = "hx-target"
  /// specifies the event that triggers the request
  public static let hxTrigger: Self = "hx-trigger"
  /// add values to submit with the request (JSON format)
  public static let hxVals: Self = "hx-vals"
  /// add progressive enhancement for links and forms
  public static let hxBoost: Self = "hx-boost"
  /// shows a confirm() dialog before issuing a request
  public static let hxConfirm: Self = "hx-confirm"
  /// issues a DELETE to the specified URL
  public static let hxDelete: Self = "hx-delete"
  /// disables htmx processing for the given node and any children nodes
  public static let hxDisable: Self = "hx-disable"
  /// adds the disabled attribute to the specified elements while a request is in flight
  public static let hxDisabledElt: Self = "hx-disabled-elt"
  /// control and disable automatic attribute inheritance for child nodes
  public static let hxDisinherit: Self = "hx-disinherit"
  /// changes the request encoding type
  public static let hxEncoding: Self = "hx-encoding"
  /// extensions to use for this element
  public static let hxExt: Self = "hx-ext"
  /// adds to the headers that will be submitted with the request
  public static let hxHeaders: Self = "hx-headers"
  /// prevent sensitive data being saved to the history cache
  public static let hxHistory: Self = "hx-history"
  /// the element to snapshot and restore during history navigation
  public static let hxHistoryElt: Self = "hx-history-elt"
  /// include additional data in requests
  public static let hxInclude: Self = "hx-include"
  /// the element to put the htmx-request class on during the request
  public static let hxIndicator: Self = "hx-indicator"
  /// filters the parameters that will be submitted with a request
  public static let hxParams: Self = "hx-params"
  /// issues a PATCH to the specified URL
  public static let hxPatch: Self = "hx-patch"
  /// specifies elements to keep unchanged between requests
  public static let hxPreserve: Self = "hx-preserve"
  /// shows a prompt() before submitting a request
  public static let hxPrompt: Self = "hx-prompt"
  /// issues a PUT to the specified URL
  public static let hxPut: Self = "hx-put"
  /// replace the URL in the browser location bar
  public static let hxReplaceUrl: Self = "hx-replace-url"
  /// configures various aspects of the request
  public static let hxRequest: Self = "hx-request"
  /// control how requests made by different elements are synchronized
  public static let hxSync: Self = "hx-sync"
  /// force elements to validate themselves before a request
  public static let hxValidate: Self = "hx-validate"
}

// TODO: hx-o
// handle events with inline scripts on elements
// hx-on*
