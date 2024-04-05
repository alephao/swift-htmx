import Htmx
import HTTPTypes

// Request or Response Headers
extension HTTPField.Name {
  /// Request: the id of the triggered element if it exists
  /// Response: allows you to trigger client-side events
  public static var hxTrigger: Self { .init("HX-Trigger")! }
}

// Request Headers
extension HTTPField.Name {
  /// Request: indicates that the request is via an element using hx-boost
  public static var hxBoosted: Self { .init("HX-Boosted")! }
  /// Request: the current URL of the browser
  public static var hxCurrentURL: Self { .init("HX-Current-URL")! }
  /// Request: “true” if the request is for history restoration after a miss in the local history cache
  public static var hxHistoryRestoreRequest: Self { .init("HX-History-Restore-Request")! }
  /// Request: the user response to an hx-prompt
  public static var hxPrompt: Self { .init("HX-Prompt")! }
  /// Request: always “true”
  public static var hxRequest: Self { .init("HX-Request")! }
  /// Request: the id of the target element if it exists
  public static var hxTarget: Self { .init("HX-Target")! }
  /// Request: the name of the triggered element if it exists
  public static var hxTriggerName: Self { .init("HX-Trigger-Name")! }
}

// Response Headers
extension HTTPField.Name {
  /// Response: allows you to do a client-side redirect that does not do a full page reload
  public static var hxLocation: Self { .init("HX-Location")! }
  /// Response: pushes a new url into the history stack
  public static var hxPushUrl: Self { .init("HX-Push-Url")! }
  /// Response: can be used to do a client-side redirect to a new location
  public static var hxRedirect: Self { .init("HX-Redirect")! }
  /// Response: if set to “true” the client-side will do a full refresh of the page
  public static var hxRefresh: Self { .init("HX-Refresh")! }
  /// Response: replaces the current URL in the location bar
  public static var hxReplaceUrl: Self { .init("HX-Replace-Url")! }
  /// Response: allows you to specify how the response will be swapped. See hx-swap for possible values
  public static var hxReswap: Self { .init("HX-Reswap")! }
  /// Response: a CSS selector that updates the target of the content update to a different element on the page
  public static var hxRetarget: Self { .init("HX-Retarget")! }
  /// Response: a CSS selector that allows you to choose which part of the response is used to be swapped in. Overrides an existing hx-select on the triggering element
  public static var hxReselect: Self { .init("HX-Reselect")! }
  /// Response: allows you to trigger client-side events after the settle step
  public static var hxTriggerAfterSettle: Self { .init("HX-Trigger-After-Settle")! }
  /// Response: allows you to trigger client-side events after the swap step
  public static var hxTriggerAfterSwap: Self { .init("HX-Trigger-After-Swap")! }
}

