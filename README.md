# Swift Authentication

![Swift](https://github.com/sejr/swift-authentication/workflows/Swift/badge.svg)

This Swift package provides lightweight yet opinionated abstractions enabling developers to build secure authentication systems.

- **`Authentication`** is the foundation for all other libraries. It defines the `Credential` and `AuthenticationService` protocols, which are the building blocks for authentication flows of varying complexity.
- **`WebAuthentication`** builds on that foundation to help developers build web-based authentication mechanisms, such as the [Web Authentication API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Authentication_API).

## Getting Started

### Installation

#### [Swift Package Manager](https://swift.org/package-manager/)

Update your `Package.swift` file like so:

```swift
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        .package(url: "https://github.com/sejr/swift-authentication", from: "x.y.z"),
        // other dependencies
    ],
    targets: [
        .target(name: "<target>", dependencies: [
            // For custom authentication systems (not recommended, but possible)
            "Authentication",
            
            // For web-based authentication systems
            "WebAuthentication"
            
            // other target dependencies
        ]),
        // other targets
    ]
)
```

## Roadmap

Our long-term goal is to provide "batteries-included" solutions for authentication in various domains.

### Authentication for the web

**The web is our first priority.** Most prior work related to Swift web authentication has been done within the [Vapor](https://vapor.codes/) project. If you are looking for a production-ready framework for building web services (with or without authentication requirements) in Swift, we strongly recommend you start there.

Our `WebAuthentication` package is designed to fit in the space between Vapor and [SwiftNIO](https://github.com/apple/swift-nio), which Vapor is already built on. We will provide _middleware_ suitable for integration within Vapor, though SwiftNIO will be the only required dependency.
