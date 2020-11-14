@testable import Authentication

class ExampleAuthenticationService {
    /// General notion of user identity within this example service.
    struct User: Equatable, Identifiable {
        /// The unique ID for the user.
        var id: String
    }
    
    /// General error for this example service.
    enum ServiceError: Error {
        /// Invalid username and password combination.
        case invalidCredential
        
        /// Something else went wrong.
        case unknown
    }
}

extension ExampleAuthenticationService: AuthenticationService {
    typealias AuthenticationCredential = ServiceCredential
    typealias AuthenticationSuccess = User
    typealias AuthenticationFailure = ServiceError
    
    public struct ServiceCredential: PasswordCredential {
        public var id: String
        public var password: String
    }
    
    func authenticate(
        with credential: ExampleAuthenticationService.ServiceCredential,
        completion: @escaping (Result<ExampleAuthenticationService.User, ExampleAuthenticationService.ServiceError>) -> Void) {
        let validUsername = credential.id == "testing"
        let validPassword = credential.password == "testing"
        
        if (validUsername && validPassword) {
            completion(.success(ExampleAuthenticationService.User(id: credential.id)))
        } else {
            completion(.failure(.invalidCredential))
        }
    }
}
