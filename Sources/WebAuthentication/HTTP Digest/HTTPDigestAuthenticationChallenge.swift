/// An HTTP Digest authentication challenge issued by a server in response to a protected resource.
///
/// This value should be serialized into the `WWW-Authenticate` HTTP response header when a protected resource
/// is requested without an appropriate `Authorization` HTTP request header.
public struct HTTPDigestAuthenticationChallenge {
    var realm: String
    var qop: QualityOfProtection?
    var nonce: String
    var opaque: String
}

extension HTTPDigestAuthenticationChallenge: CustomStringConvertible {
    public var description: String {
        return "TODO"
    }
}
