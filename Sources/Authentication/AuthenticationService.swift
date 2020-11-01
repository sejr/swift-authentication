/// Functionality that enables a service to _authenticate_ an entity.
///
/// Authentication is defined as verifying the identity of the entity. This specifically does not include
/// functionality for determining which actions the entity has _authorization_ for.
public protocol AuthenticationService {
    /// Information that can be used to verify the identity of an entity.
    ///
    /// This information will generally have some security implications; you should ensure it is transmitted
    /// and stored (if necessary) in a secure fashion, using encryption and/or hashing. Those mechanisms are
    /// outside the scope of the Swift Authentication package.
    associatedtype AuthenticationCredential: Credential
    
    /// The result of a successful authentication request.
    associatedtype AuthenticationSuccess
    
    /// The result of a failed authentication request.
    associatedtype AuthenticationFailure: Error
    
    /// Authenticates a user based on some provided `Credential`.
    func authenticate(
        with credential: AuthenticationCredential,
        completion: @escaping (Result<AuthenticationSuccess, AuthenticationFailure>) -> Void
    )
}
