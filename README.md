# Swift Authentication

![Swift](https://github.com/sejr/swift-authentication/workflows/Swift/badge.svg)

This Swift package provides a simple protocol-based interface for defining authentication mechanisms for a service.

At its foundation is the `AuthenticationService` protocol, copied here for convenience:

```swift
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
    func authenticate(withCredential credential: Credential) -> Result<AuthenticationSuccess, AuthenticationFailure>
}
```

Beyond this protocol, you are largely on your own. The goal of this project is to provide some common credential types, such as the `UsernamePasswordCredential` for basic username and password authentication.

## Getting Started

### Installation

#### [Swift Package Manager](https://swift.org/package-manager/)

Update your `Package.swift` file like so:

```swift
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        .package(url: "https://github.com/sejr/swift-authentication", from: "0.1.0"),
        // other dependencies
    ],
    targets: [
        .target(name: "<target>", dependencies: [
            "Authentication",
            // other dependencies
        ]),
        // other targets
    ]
)
```

### Defining an authentication service

```swift
import Authentication

/// An example service.
///
/// Notice that this definition has nothing pertaining to authentication; we encapsulate all of that
/// information inside an extension.
class ExampleAuthenticationService {
    /// General notion of user identity within this example service.
    struct User {
        /// The unique ID for the user.
        var id: String
    }
    
    /// General error for this example service.
    enum ServiceError: Error {
        /// Invalid username and password combination.
        case invalidCredential
        
        /// Something else went wrong.
        case unknown
    }
}

extension ExampleAuthenticationService: AuthenticationService {
    typealias Credential = UsernamePasswordCredential // provided by Authentication
    typealias AuthenticationSuccess = User // defined above
    typealias AuthenticationFailure = ServiceError // defined above
    
    public struct ServiceCredential: UsernamePasswordCredential {
        var username: String
        var password: String
    }
    
    func authenticate(
        withCredential credential: UsernamePasswordCredential
    ) -> Result<ExampleAuthenticationService.User, ExampleAuthenticationService.ServiceError> {
        let validUsername = credential.username == "testing"
        let validPassword = credential.password == "testing"
        
        if (validUsername && validPassword) {
            return .success(ExampleAuthenticationService.User(id: credential.username))
        } else {
            return .failure(.invalidCredential)
        }
    }
}

```

### Building a credential

This step is largely dependent on how you have defined your credential. Because our `ExampleAuthenticationService` has defined a
`ServiceCredential` type that conforms to `UsernamePasswordCredential`, it can be used like so:

```swift
let credential = ExampleAuthenticationService.ServiceCredential(
    username: "testing",
    password: "testing"
)
```

### Authenticating the credential against the service

The `AuthenticationService` provides a single function, `authenticate`, which takes the credential type you've defined, and returns the result you've defined. It's pretty straight-forward, right?

```swift
let result = service.authenticate(withCredential: credential)

// Check result of authentication attempt
switch result {
case .success(let user):
    print(user.id)
case .failure(let err):
    print(err)
}
```
