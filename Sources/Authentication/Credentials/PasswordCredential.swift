/// Authentication `Credential` based on an entity ID and password combination.
///
/// Swift Authentication requires you to implement your own type conforming to `PasswordCredential`.
///
///     struct ExamplePasswordCredential: PasswordCredential {
///         var id: String // ID of authenticating entity
///         var password: String // Password provided for entity
///     }
///
/// This gives you the ability to store additional data associated with an authentication attempt, which could subsequently
/// be used by your `AuthenticationService`.
public protocol PasswordCredential: Credential {
    /// The plaintext password for the entity.
    ///
    /// **This value MUST be hashed before it is stored in a database or other storage mechanism.** Failing to do
    /// so will put your users at great risk in the event that your service is compromised. You must assume that any value you
    /// store could be visible to an attacker at some point.
    var password: String { get }
}
