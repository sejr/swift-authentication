import Authentication

public enum WebAuthenticationResponse {
    case assertion
    case attestation
}

public enum WebAuthenticationError: Error {
    case unimplemented
}

public final class WebAuthenticationService: AuthenticationService {
    public typealias AuthenticationCredential = WebCredential
    public typealias AuthenticationSuccess = WebAuthenticationResponse
    public typealias AuthenticationFailure = WebAuthenticationError
    
    /// Registers an authenticator.
    ///
    /// - Parameters:
    ///   - credential: Credential to be registered.
    ///   - completion: Callback function to be executed with the result of the registration.
    public func register(credential: WebCredential, completion: @escaping (Result<WebAuthenticationResponse, WebAuthenticationError>) -> Void) {
        completion(.failure(.unimplemented))
    }
    
    public func authenticate(with credential: WebCredential, completion: @escaping (Result<WebAuthenticationResponse, WebAuthenticationError>) -> Void) {
        switch credential.type {
        case .federated(let details):
            print(details.protocol)
        case .password(let details):
            print(details.password)
        case .publicKey:
            print("Public key!")
        }
    }
}
