// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPMModules",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SPMUIKit",
            targets: ["SPMUIKitTarget"]),
//        .library(
//            name: "SPMTemplate",
//            targets: ["SPMTemplate"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/sf-jed-kyung/spm-chat",
            from: "1.0.2"
        ),
    ],
    targets: [
//        .binaryTarget(
//            name: "SPMTemplate",
//            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.0/SPMTemplate.xcframework.zip",
//            checksum: "2263767c49e2b51aa1368362269178fe8096f9152e7c00024ab8382960a2f4e2"
//        ),
        .binaryTarget(
            name: "SPMUIKit",
            url: "https://github.com/sf-jed-kyung/spm-modules/releases/download/1.0.1/SPMUIKit.xcframework.zip",
            checksum: "2333a1e69ba4d32db656bd13cac6fe49886f3741fae76437d8f9eeebce1c1704"
        ),
        .target(
            name: "SPMUIKitTarget",
            dependencies: [
                .target(name: "SPMUIKit"),
                .product(name: "SPMChat", package: "spm-chat")
            ],
            path: "Framework/Dependency"
        ),
    ]
)
