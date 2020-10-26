# Swift Authentication

This Swift package provides a simple interface for defining authentication mechanisms for a service.

At its foundation is the `AuthenticationService` protocol, which has some required associated types:

- **The `Credential` type stores information that can be used to verify a user's identity.** This could be a username and password combination, a private encryption key, API key, or something else.
- **The `AuthenticationSuccess` type contains the result of a successful authentication attempt.** This could just be the ID of the authenticated user, but could optionally include additional information depending on your use case.
- **The `AuthenticationFailure` type contains the result of a failed authentication attempt.** This value must conform to `Error` and can include any necessary troubleshooting information you choose.

Generally, an authentication attempt will look something like this:

```swift
let service = ExampleAuthenticationService()
let credential = ExampleAuthenticationService.ServiceCredential(
    username: "testing",
    password: "testing"
)
let result = service.authenticate(withCredential: credential)

// Check result of authentication attempt
switch result {
case .success(let user):
    print(user.id)
case .failure(let err):
    print(err)
}
```
