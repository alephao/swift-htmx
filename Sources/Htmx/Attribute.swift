public enum Attribute {
  public struct Name: ExpressibleByStringLiteral {
    public let value: String

    public typealias StringLiteralType = String
    public init(stringLiteral: String) {
      self.value = stringLiteral
    }
  }
}

public enum HxSwap: String, CustomStringConvertible {
  ///  Replace the inner html of the target element
  case innerHTML = "innerHTML"
  ///  Replace the entire target element with the response
  case outerHTML = "outerHTML"
  ///  Insert the response before the target element
  case beforebegin = "beforebegin"
  ///  Insert the response before the first child of the target element
  case afterbegin = "afterbegin"
  ///  Insert the response after the last child of the target element
  case beforeend = "beforeend"
  ///  Insert the response after the target element
  case afterend = "afterend"
  ///  Deletes the target element regardless of the response
  case delete = "delete"
  /// Does not append content from response (out of band items will still be processed).
  case none = "none"

  public var description: String { rawValue }
}

extension Attribute.Name {
  /// issues a GET to the specified URL
  public static let hxGet = "hx-get"
  /// issues a POST to the specified URL
  public static let hxPost = "hx-post"
  /// push a URL into the browser location bar to create history
  public static let hxPushUrl = "hx-push-url"
  /// select content to swap in from a response
  public static let hxSelect = "hx-select"
  /// select content to swap in from a response, somewhere other than the target (out of band)
  public static let hxSelectOob = "hx-select-oob"
  /// controls how content will swap in (outerHTML, beforeend, afterend, …)
  public static let hxSwap = "hx-swap"
  /// mark element to swap in from a response (out of band)
  public static let hxSwapOob = "hx-swap-oob"
  /// specifies the target element to be swapped
  public static let hxTarget = "hx-target"
  /// specifies the event that triggers the request
  public static let hxTrigger = "hx-trigger"
  /// add values to submit with the request (JSON format)
  public static let hxVals = "hx-vals"
  /// add progressive enhancement for links and forms
  public static let hxBoost = "hx-boost"
  /// shows a confirm() dialog before issuing a request
  public static let hxConfirm = "hx-confirm"
  /// issues a DELETE to the specified URL
  public static let hxDelete = "hx-delete"
  /// disables htmx processing for the given node and any children nodes
  public static let hxDisable = "hx-disable"
  /// adds the disabled attribute to the specified elements while a request is in flight
  public static let hxDisabledElt = "hx-disabled-elt"
  /// control and disable automatic attribute inheritance for child nodes
  public static let hxDisinherit = "hx-disinherit"
  /// changes the request encoding type
  public static let hxEncoding = "hx-encoding"
  /// extensions to use for this element
  public static let hxExt = "hx-ext"
  /// adds to the headers that will be submitted with the request
  public static let hxHeaders = "hx-headers"
  /// prevent sensitive data being saved to the history cache
  public static let hxHistory = "hx-history"
  /// the element to snapshot and restore during history navigation
  public static let hxHistoryElt = "hx-history-elt"
  /// include additional data in requests
  public static let hxInclude = "hx-include"
  /// the element to put the htmx-request class on during the request
  public static let hxIndicator = "hx-indicator"
  /// filters the parameters that will be submitted with a request
  public static let hxParams = "hx-params"
  /// issues a PATCH to the specified URL
  public static let hxPatch = "hx-patch"
  /// specifies elements to keep unchanged between requests
  public static let hxPreserve = "hx-preserve"
  /// shows a prompt() before submitting a request
  public static let hxPrompt = "hx-prompt"
  /// issues a PUT to the specified URL
  public static let hxPut = "hx-put"
  /// replace the URL in the browser location bar
  public static let hxReplaceUrl = "hx-replace-url"
  /// configures various aspects of the request
  public static let hxRequest = "hx-request"
  /// control how requests made by different elements are synchronized
  public static let hxSync = "hx-sync"
  /// force elements to validate themselves before a request
  public static let hxValidate = "hx-validate"
}

// TODO: hx-o
// handle events with inline scripts on elements
// hx-on*
