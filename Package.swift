// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPMModules",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SPMUIKit",
            targets: ["SPMUIKitTarget"]),
        .library(
            name: "SPMTemplate",
            targets: ["SPMTemplateTarget"]),
        .library(
            name: "SPMOpenChannel",
            targets: ["SPMOpenChannelTarget"]),
        .library(
            name: "SPMGroupChannel",
            targets: ["SPMGroupChannelTarget"]),
        .library(
            name: "SPMBusinessMessaging",
            targets: ["SPMBusinessMessagingTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/sf-jed-kyung/spm-chat",
            from: "1.0.3"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "SPMTemplate",
            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.9/SPMTemplate.xcframework.zip",
            checksum: "577162bfe0a691828a8008ee3875e69b71924e5d2ba1ebe6456f768a24aa1842"
        ),
        .binaryTarget(
            name: "SPMUIKit",
            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.9/SPMUIKit.xcframework.zip",
            checksum: "29c2e36730d77361bc67838271d15d90aa65719268592636bc1ffac721b5ce82"
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
                .product(name: "SPMChat", package: "spm-chat")
            ],
            path: "Framework/SPMTemplate",
            resources: [
               .copy("Resources/PrivacyInfo.xcprivacy"),
            ]
        ),
        
        .target(
            name: "SPMOpenChannelTarget",
            dependencies: [
                .product(name: "SPMChat", package: "spm-chat")
            ],
            path: "Framework/SPMOpenChannel",
            resources: [
               .copy("Resources/PrivacyInfo.xcprivacy"),
            ]
        ),
        
        .target(
            name: "SPMGroupChannelTarget",
            dependencies: [
                .product(name: "SPMChat", package: "spm-chat")
            ],
            path: "Framework/SPMGroupChannel",
            resources: [
               .copy("Resources/PrivacyInfo.xcprivacy"),
            ]
        ),
        
        .target(
            name: "SPMBusinessMessagingTarget",
            dependencies: [
                .product(name: "SPMChat", package: "spm-chat")
            ],
            path: "Framework/SPMBusinessMessaging",
            resources: [
               .copy("Resources/PrivacyInfo.xcprivacy"),
            ]
        ),
    ],
    cxxLanguageStandard: .cxx11
)
