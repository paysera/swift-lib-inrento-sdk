// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "PayseraInRentoSDK",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(name: "PayseraInRentoSDK", targets: ["PayseraInRentoSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", .exact("5.4.3")),
        .package(url: "https://github.com/mxcl/PromiseKit", .exact("6.15.3")),
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
