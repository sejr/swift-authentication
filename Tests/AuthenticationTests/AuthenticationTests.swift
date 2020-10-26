import XCTest
@testable import Authentication

final class AuthenticationTests: XCTestCase {
    func testExample() {
        let service = ExampleAuthenticationService()
        let credential = ExampleAuthenticationService.ServiceCredential(
            username: "testing",
            password: "testing"
        )
        let result = service.authenticate(withCredential: credential)
        
        // Check result of authentication attempt
        switch result {
        case .success(let user):
            print(user.id)
        case .failure(let err):
            print(err)
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}




