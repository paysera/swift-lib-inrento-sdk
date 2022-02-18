// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "PayseraInRentoSDK",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(name: "PayseraInRentoSDK", targets: ["PayseraInRentoSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/mxcl/PromiseKit", .upToNextMajor(from: "6.0.0")),
    ],
    targets: [
        .target(
            name: "PayseraInRentoSDK",
            dependencies: [
                "Alamofire",
                "PromiseKit",
            ]
        ),
        .testTarget(
            name: "PayseraInRentoSDKTests",
            dependencies: ["PayseraInRentoSDK"]
        ),
    ]
)
