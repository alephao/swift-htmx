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
