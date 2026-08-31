// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.14.0"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let googleAdapterChecksum = """
c76076b0d3a5b18507e0384cb55d08afb6db677e661b891e67444315b6466fe0
"""

let package = Package(
    name: "ANGoogleAdapter",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v12)
    ],

    products: [
        .library(
            name: "ANGoogleAdapter",
            targets: [
                "ANGoogleAdapter",
                "ANGoogleAdapterDependencies"
            ]
        )
    ],

    dependencies: [
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            exact: "12.8.0"
        ),
        
        .package(
            url: "https://github.com/appnexus/mobile-sdk-ios-spm.git",
            exact: Version(stringLiteral: sdkVersion)
        )
    ],

    targets: [
        .binaryTarget(
            name: "ANGoogleAdapter",
            url: "\(baseUrl)/\(sdkVersion)/static/ANGoogleAdapter.zip",
            checksum: googleAdapterChecksum
        ),

        .target(
            name: "ANGoogleAdapterDependencies",
            dependencies: [
                .product(
                    name: "GoogleMobileAds",
                    package: "swift-package-manager-google-mobile-ads"
                ),
                
                .product(
                    name: "AppNexusSDK",
                    package: "mobile-sdk-ios-spm"
                )
            ]
        )
    ]
)
