import Authentication

/// Provides information about an entity as a prerequisite to a trust decision.
///
/// [Reference](https://developer.mozilla.org/en-US/docs/Web/API/Credential)
public enum WebCredentialType {
    /// Provides information about a username/password pair.
    ///
    /// [Reference](https://developer.mozilla.org/en-US/docs/Web/API/PasswordCredential)
    case password(WebCredentialDetailsPassword)
    
    /// Provides information about credentials from a federated identity provider, which is an entity that a website
    /// trusts to correctly authenticate a user, and which provides an API for that purpose.
    ///
    /// [Reference](https://developer.mozilla.org/en-US/docs/Web/API/FederatedCredential)
    case federated(WebCredentialDetailsFederated)
    
    /// Provides a credential for logging in using a more secure system based on asymmetric cryptography
    /// instead of a password.
    ///
    /// [Reference](https://developer.mozilla.org/en-US/docs/Web/API/PublicKeyCredential)
    case publicKey
}

/// Provides information about an entity as a prerequisite to a trust decision.
///
/// [Reference](https://developer.mozilla.org/en-US/docs/Web/API/Credential)
public class WebCredential: Credential {
    public var id: String
    public var type: WebCredentialType
    
    public init(id: String, type: WebCredentialType) {
        self.id = id
        self.type = type
    }
}
