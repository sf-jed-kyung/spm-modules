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
            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.5/SPMTemplate.xcframework.zip",
            checksum: "577162bfe0a691828a8008ee3875e69b71924e5d2ba1ebe6456f768a24aa1842"
        ),
        .binaryTarget(
            name: "SPMUIKit",
            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.5/SPMUIKit.xcframework.zip",
            checksum: "2333a1e69ba4d32db656bd13cac6fe49886f3741fae76437d8f9eeebce1c1704"
        ),
        
        .target(
            name: "SPMUIKitTarget",
            dependencies: [
                .target(name: "SPMUIKit"),
                .target(name: "SPMTemplate"),
                .product(name: "SPMChat", package: "spm-chat")
            ],
            path: "Framework/SPMUIKit"
        ),
        
        .target(
            name: "SPMTemplateTarget",
            dependencies: [
                .product(name: "SPMChat", package: "spm-chat")
            ],
            path: "Framework/SPMTemplate"
        ),
    ]
)
