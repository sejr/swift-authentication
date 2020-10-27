/// Functionality that enables a service to _authenticate_ a user.
///
/// Authentication is defined as verifying the identity of the user. This specifically does not include
/// functionality for determining which actions the user has _authorization_ for.
public protocol AuthenticationService {
    /// Information that can be used to verify the identity of a user.
    ///
    /// This information will generally have some security implications; you should ensure it is transmitted
    /// and stored (if necessary) in a secure fashion, using encryption and/or hashing. Those mechanisms are
    /// outside the scope of the Swift Authentication package.
    associatedtype Credential
    
    /// The result of a successful authentication request.
    associatedtype AuthenticationSuccess
    
    /// The result of a failed authentication request.
    associatedtype AuthenticationFailure: Error
    
    /// Authenticates a user based on some provided `Credential`.
    func authenticate(with credential: Credential) -> Result<AuthenticationSuccess, AuthenticationFailure>
}
