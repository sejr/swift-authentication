import XCTest
@testable import Authentication

final class AuthenticationTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Authentication().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
