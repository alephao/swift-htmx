import Htmx
import XCTest

final class HtmxTests: XCTestCase {
  func testHxParams() {
    XCTAssertEqual(HxParams.not("a", "b", "c").description, "not a, b, c")
    XCTAssertEqual(HxParams.some("a", "b", "c").description, "a, b, c")
  }

  func testHxRequest() {
    XCTAssertEqual(HxRequest(timeout: 100).description, "\"timeout\": 100")
    XCTAssertEqual(HxRequest(credentials: true).description, "\"credentials\": true")
    XCTAssertEqual(HxRequest(noHeaders: true).description, "\"noHeaders\": true")
    XCTAssertEqual(HxRequest(timeout: 100, credentials: true).description, "\"timeout\": 100, \"credentials\": true")
    XCTAssertEqual(HxRequest(timeout: 100, credentials: true, noHeaders: true).description, "\"timeout\": 100, \"credentials\": true, \"noHeaders\": true")
  }
}
