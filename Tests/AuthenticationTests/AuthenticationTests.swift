import XCTest
@testable import Authentication

final class AuthenticationTests: XCTestCase {
    func testExample() {
        let service = ExampleAuthenticationService()
        let credential = ExampleAuthenticationService.ServiceCredential(
            username: "testing",
            password: "testing"
        )
        
        let expectedUser = ExampleAuthenticationService.User(id: "testing")
        let expectedResult: Result<ExampleAuthenticationService.User, ExampleAuthenticationService.ServiceError> = .success(expectedUser)
        let result = service.authenticate(with: credential)
        XCTAssertEqual(result, expectedResult)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}




