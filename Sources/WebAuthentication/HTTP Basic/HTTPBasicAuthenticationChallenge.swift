/// An HTTP Basic authentication challenge issued by a server in response to a protected resource.
///
/// This value should be serialized into the `WWW-Authenticate` HTTP response header when a protected resource
/// is requested without an appropriate `Authorization` HTTP request header.
public struct HTTPBasicAuthenticationChallenge {
    /// The `realm` authentication parameter is reserved for use by authentication schemes that wish to indicate a scope of
    /// protection.
    ///
    /// A protection space is defined by the canonical root URI (the scheme and authority components of the effective request URI;
    /// see Section 5.5 of [RFC7230]) of the server being accessed, in combination with the realm value if present. These realms allow the protected resources on a server to be partitioned into a set of protection
    ///
    /// [Reference](https://tools.ietf.org/html/rfc7235#section-2.2)
    var realm: String
    
    /// In challenges, servers can use the 'charset' authentication parameter to indicate the character encoding scheme
    /// they expect the user agent to use when generating "user-pass" (a sequence of octets).
    ///
    /// This information is purely advisory.
    ///
    /// The only allowed value is "UTF-8"; it is to be matched case-insensitively (see [RFC2978], Section 2.3). It indicates that the
    /// server expects character data to be converted to Unicode Normalization Form C ("NFC"; see Section 3 of [RFC5198]) and
    /// to be encoded into octets using the UTF-8 character encoding scheme ([RFC3629]).
    ///
    /// [Reference](https://tools.ietf.org/html/rfc7617#section-2.1)
    var charset: String = "UTF-8"
}

extension HTTPBasicAuthenticationChallenge: CustomStringConvertible {
    public var description: String {
        return """
        Basic realm="\(self.realm)", charset="UTF-8"
        """
    }
}
