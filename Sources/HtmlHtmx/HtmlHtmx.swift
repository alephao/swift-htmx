import Html
import Htmx

private func dictToJson(_ dict: [String: String]) -> String {
  let inner =
    dict
    .map({ key, val in "\"\(key)\":\"\(val)\"" })
    .joined(separator: ",")
  return "{\(inner)}"
}

extension Html.Attribute {
  fileprivate static func htmx(_ key: Htmx.Attribute.Name, _ val: String?) -> Self {
    .init(key.description, val)
  }
}

extension Html.Attribute {
  /// issues a GET to the specified URL
  public static func hxGet(_ url: String) -> Self { .htmx(.hxGet, url) }
  /// issues a POST to the specified URL
  public static func hxPost(_ url: String) -> Self { .htmx(.hxPost, url) }
  /// push a URL into the browser location bar to create history
  public static func hxPushUrl(_ value: HxPushUrl) -> Self { .htmx(.hxPushUrl, value.description) }
  /// select content to swap in from a response
  public static func hxSelect(_ selector: String) -> Self { .htmx(.hxSelect, selector) }
  /// select content to swap in from a response, somewhere other than the target (out of band)
  public static func hxSelectOob(_ selector: String) -> Self { .htmx(.hxSelectOob, selector) }
  /// controls how content will swap in (outerHTML, beforeend, afterend, …)
  public static func hxSwap(_ value: HxSwap = .innerHTML) -> Self {
    .htmx(.hxSwap, value.description)
  }
  /// controls how content will swap in (outerHTML, beforeend, afterend, …)
  public static func hxSwap(raw rawValue: String) -> Self { .htmx(.hxSwap, rawValue) }
  /// mark element to swap in from a response (out of band)
  public static func hxSwapOob(_ value: HxSwap = .outerHTML) -> Self {
    .htmx(.hxSwapOob, value.description)
  }
  /// mark element to swap in from a response (out of band)
  public static func hxSwapOob(raw rawValue: String) -> Self { .htmx(.hxSwapOob, rawValue) }
  /// specifies the target element to be swapped
  public static func hxTarget(_ target: String) -> Self { .htmx(.hxTarget, target) }
  /// specifies the event that triggers the request
  public static func hxTrigger(_ event: String) -> Self { .htmx(.hxTrigger, event) }
  /// add values to submit with the request (JSON format)
  public static func hxVals(_ rawValue: String) -> Self { .htmx(.hxVals, rawValue) }
  /// add progressive enhancement for links and forms
  public static func hxBoost() -> Self { .htmx(.hxBoost, "true") }
  /// shows a confirm() dialog before issuing a request
  public static func hxConfirm(_ prompt: String) -> Self { .htmx(.hxConfirm, prompt) }
  /// issues a DELETE to the specified URL
  public static func hxDelete(_ url: String) -> Self { .htmx(.hxDelete, url) }
  /// disables htmx processing for the given node and any children nodes
  public static func hxDisable() -> Self { .htmx(.hxDisable, nil) }
  /// adds the disabled attribute to the specified elements while a request is in flight
  public static func hxDisabledElt(_ selector: String) -> Self { .htmx(.hxDisabledElt, selector) }
  /// control and disable automatic attribute inheritance for child nodes
  public static func hxDisinherit(_ attributes: [Htmx.Attribute.Name] = []) -> Self {
    .htmx(
      .hxDisinherit,
      attributes.count == 0 ? "*" : attributes.map(\.description).joined(separator: " ")
    )
  }
  /// changes the request encoding type
  public static func hxEncoding() -> Self { .htmx(.hxDisinherit, "multipart/form-data") }
  /// extensions to use for this element
  public static func hxExt(_ rawValue: String) -> Self { .htmx(.hxExt, rawValue) }
  /// adds to the headers that will be submitted with the request
  public static func hxHeaders(raw rawValue: String) -> Self { .htmx(.hxHeaders, rawValue) }
  /// adds to the headers that will be submitted with the request
  public static func hxHeaders(_ headers: [String: String]) -> Self {
    .htmx(.hxHeaders, dictToJson(headers))
  }
  /// prevent sensitive data being saved to the history cache
  public static func hxHistory() -> Self { .htmx(.hxHistory, "false") }
  /// the element to snapshot and restore during history navigation
  public static func hxHistoryElt() -> Self { .htmx(.hxHistoryElt, nil) }
  /// include additional data in requests
  public static func hxInclude(_ rawValue: String) -> Self { .htmx(.hxInclude, rawValue) }
  /// the element to put the htmx-request class on during the request
  public static func hxIndicator(_ selector: String) -> Self { .htmx(.hxIndicator, selector) }
  /// filters the parameters that will be submitted with a request
  public static func hxParams(_ params: HxParams) -> Self { .htmx(.hxParams, params.description) }
  /// issues a PATCH to the specified URL
  public static func hxPatch(_ url: String) -> Self { .htmx(.hxPatch, url) }
  /// specifies elements to keep unchanged between requests
  public static func hxPreserve() -> Self { .htmx(.hxPreserve, nil) }
  /// shows a prompt() before submitting a request
  public static func hxPrompt(_ prompt: String) -> Self { .htmx(.hxPrompt, prompt) }
  /// issues a PUT to the specified URL
  public static func hxPut(_ url: String) -> Self { .htmx(.hxPut, url) }
  /// replace the URL in the browser location bar
  public static func hxReplaceUrl(_ value: HxReplaceUrl) -> Self {
    .htmx(.hxReplaceUrl, value.description)
  }
  /// configures various aspects of the request
  public static func hxRequest(raw rawValue: String) -> Self { .htmx(.hxRequest, rawValue) }
  /// configures various aspects of the request
  public static func hxRequest(_ value: HxRequest) -> Self { .htmx(.hxRequest, value.description) }
  /// control how requests made by different elements are synchronized
  public static func hxSync(raw rawValue: String) -> Self { .htmx(.hxSync, rawValue) }
  /// force elements to validate themselves before a request
  public static func hxValidate() -> Self { .htmx(.hxValidate, "true") }
}
