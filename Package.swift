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
            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.15/SPMTemplate.xcframework.zip",
            checksum: "6352c575e3dff227e66e66030a5ce86a177e3eb77fe3cdc59377be0f0a2357a4"
        ),
        .binaryTarget(
            name: "SPMUIKit",
            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.15/SPMUIKit.xcframework.zip",
            checksum: "ea6c96a0a76af71356e693faf6e85953aa1deb62c6937fbf293bb206ab47d4b7"
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
