/// Asserts the identity of its bearer.
///
/// Types conforming to this protocol should define additional attributes (such as `password` on `PasswordCredential`),
/// which can be used to verify the associated identity.
///
/// Note that this is an _attempted_ assertion of identity; identity must not be assumed until the `Credential` is verified
/// by an `AuthenticationService`.
public protocol Credential: Identifiable {}
