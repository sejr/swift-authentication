/// Authentication credential based on a username and password combination.
///
/// If you choose to implement support for this credential, you must ensure that this information is encrypted
/// in transit.
public protocol UsernamePasswordCredential {
    /// The unique identifier for the user.
    ///
    /// This value should not change; generally it is a randomly generated value (such as a UUID) or an email address.
    var username: String { get }
    
    /// The plaintext password for the user.
    ///
    /// **This value MUST be hashed before it is stored in a database or other storage mechanism.** Failing to do
    /// so will put your users at great risk in the event that your service is compromised. You must assume that any value you
    /// store could be visible to an attacker at some point.
    var password: String { get }
}
