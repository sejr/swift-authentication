// swift-tools-version:5.1

import PackageDescription

/// Swift Authentication package definition.
let package = Package(
    name: "Authentication",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "Authentication", targets: ["Authentication"]),
        .library(name: "OneTimePasswords", targets: ["OneTimePasswords"]),
        .library(name: "WebAuthentication", targets: ["WebAuthentication"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-crypto", from: "1.1.0"),
        .package(url: "https://github.com/apple/swift-nio", from: "2.0.0"),
    ],
    targets: [
        .target(name: "Authentication", dependencies: []),
        .testTarget(
            name: "AuthenticationTests",
            dependencies: ["Authentication"]
        ),
        
        .target(
            name: "OneTimePasswords",
            dependencies: [
                "Authentication",
                "Crypto"
            ]
        ),
        
        .target(
            name: "WebAuthentication",
            dependencies: [
                "Authentication",
                "Crypto",
                "NIOHTTP1",
            ]
        ),
    ]
)
