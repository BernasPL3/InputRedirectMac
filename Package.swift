// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "InputRedirectMac",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .executable(
            name: "InputRedirectMac",
            targets: ["InputRedirectMac"]
        )
    ],
    targets: [
        .executableTarget(
            name: "InputRedirectMac",
            path: "Sources/InputRedirectMac"
        )
    ]
)
