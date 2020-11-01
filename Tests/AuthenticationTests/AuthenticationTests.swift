import XCTest
@testable import Authentication

final class AuthenticationTests: XCTestCase {
    func testExample() {
        let service = ExampleAuthenticationService()
        let user = ExampleAuthenticationService.User(id: "testing")
        let credential = ExampleAuthenticationService.ServiceCredential(
            id: user.id,
            password: "testing")
        let expectedResult: Result<ExampleAuthenticationService.User, ExampleAuthenticationService.ServiceError> = .success(user)
        
        service.authenticate(with: credential) { (result) in
            XCTAssertEqual(result, expectedResult)
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}




