import Foundation

public protocol AuthenticatorResponse {
    associatedtype ClientData: Codable
    var clientData: ClientData { get }
}

public struct AuthenticatorAttestationResponse: AuthenticatorResponse {
    public typealias ClientData = String
    public var clientData: String

}

public struct AuthenticatorAssertionResponse: AuthenticatorResponse {
    public typealias ClientData = String
    public var clientData: String
}
