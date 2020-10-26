@testable import Authentication

class ExampleAuthenticationService {
    /// General notion of user identity within this example service.
    struct User {
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
    typealias Credential = UsernamePasswordCredential
    typealias AuthenticationSuccess = User
    typealias AuthenticationFailure = ServiceError
    
    public struct ServiceCredential: UsernamePasswordCredential {
        var username: String
        var password: String
    }
    
    func authenticate(
        withCredential credential: UsernamePasswordCredential
    ) -> Result<AuthenticationSuccess, AuthenticationFailure> {
        let validUsername = credential.username == "testing"
        let validPassword = credential.password == "testing"
        
        if (validUsername && validPassword) {
            return .success(ExampleAuthenticationService.User(id: credential.username))
        } else {
            return .failure(.invalidCredential)
        }
    }
}
