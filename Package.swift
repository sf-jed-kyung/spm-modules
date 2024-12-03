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
            from: "1.0.4"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SPMTemplate",
            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.22/SPMTemplate.xcframework.zip",
            checksum: "1bc70f2a7f13782e18e1070248d09265f0cb79ea0bca217f95a2ef694aa5bcc6"
        ),
        .binaryTarget(
            name: "SPMUIKit",
            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.22/SPMUIKit.xcframework.zip",
            checksum: "01d8b42c3a52445c17a8f32765e4d7b4fe75b363413d2dcb93c6a001c638709b"
        ),
        
        .target(
            name: "SPMUIKitTarget",
            dependencies: [
                .target(name: "SPMUIKit"),
//                .target(name: "SPMTemplate"),
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
