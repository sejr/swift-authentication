// swift-tools-version:5.1

import PackageDescription

/// Dependencies for provided libraries.
let dependencies: [Package.Dependency] = [
//    .package(url: "https://github.com/apple/swift-crypto", from: "1.1.0"),
    .package(url: "https://github.com/apple/swift-nio", from: "2.0.0"),
]

/// Common foundation for all authentication libraries.
let authentication: Target = .target(name: "Authentication", dependencies: [])
let authenticationTests: Target = .testTarget(
    name: "AuthenticationTests",
    dependencies: ["Authentication"]
)

/// Building blocks for web-based authentication mechanisms.
let webAuthentication: Target = .target(
    name: "WebAuthentication",
    dependencies: [
        "Authentication",
//        "Crypto",
        "NIOHTTP1",
    ]
)

/// Swift Authentication package definition.
let package = Package(
    name: "Authentication",
    products: [
        .library(name: "Authentication", targets: ["Authentication"]),
        .library(name: "WebAuthentication", targets: ["WebAuthentication"]),
    ],
    dependencies: dependencies,
    targets: [
        authentication,
        authenticationTests,
        webAuthentication,
    ]
)
