public protocol AuthenticationService {
    associatedtype Credential
    associatedtype AuthenticationSuccess
    associatedtype AuthenticationFailure: Error
    
    typealias AuthenticationResult = Result<AuthenticationSuccess, AuthenticationFailure>
    
    func authenticate(withCredential credential: Credential) -> AuthenticationResult
}
