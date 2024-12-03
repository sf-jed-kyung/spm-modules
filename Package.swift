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
            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.21/SPMTemplate.xcframework.zip",
            checksum: "5b60b247dc80aaea80b8b421d3f8e989ea67b5e3411e5c479dd0693ce8170cc6"
        ),
        .binaryTarget(
            name: "SPMUIKit",
            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.21/SPMUIKit.xcframework.zip",
            checksum: "769d7888556760b64b20eb2e805baac6674362b2839f74e5d7108b4b8c173953"
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
