// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPMModules",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SPMUIKitPackage",
            targets: ["SPMUIKitTarget"]),
        .library(
            name: "SPMTemplatePackage",
            targets: ["SPMTemplateTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/sf-jed-kyung/spm-chat",
            from: "1.0.6"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SPMTemplate",
            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.23/SPMTemplate.xcframework.zip",
            checksum: "bf561cb2a7c2c1c8a38ba59836a80a88e2e58216a86b3d7c974165484eaa3e79"
        ),
        .binaryTarget(
            name: "SPMUIKit",
            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.23/SPMUIKit.xcframework.zip",
            checksum: "facf6181fd8dec5f914831b3628dab1c1734b0ecfc6fb41a40dc6a30f2f31b89"
        ),
        
        .target(
            name: "SPMUIKitTarget",
            dependencies: [
                .target(name: "SPMUIKit"),
                .target(name: "SPMTemplate"),
                .product(name: "SPMChat", package: "spm-chat")
            ],
            path: "Framework/SPMUIKit",
            resources: [
               .copy("Resources/PrivacyInfo.xcprivacy"),
            ]
        ),
        
        .target(
            name: "SPMTemplateTarget",
            dependencies: [
                .target(name: "SPMTemplate"),
                .product(name: "SPMChat", package: "spm-chat")
            ],
            path: "Framework/SPMTemplate",
            resources: [
               .copy("Resources/PrivacyInfo.xcprivacy"),
            ]
        ),
    ]
)
