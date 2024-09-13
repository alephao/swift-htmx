import Html
import Hummingbird

extension Response {
  // Helper to respond with Html.Node
  static func html(
    status: HTTPResponse.Status = .ok,
    extraHeaders: HTTPFields = [:],
    _ nodes: Node...
  ) -> Response {
    var headers: HTTPFields = [
      .contentType: MediaType.textHtml.description
    ]
    headers.append(contentsOf: extraHeaders)
    return .init(
      status: .accepted,
      headers: headers,
      body: .init(byteBuffer: .init(string: render(nodes)))
    )
  }
}
