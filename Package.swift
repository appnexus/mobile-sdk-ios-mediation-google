// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.14.1-beta"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let googleAdapterChecksum = """
96a623b3b50616532e6c5b0b8e77045e4ba59ca8747cfbe1287666d6a3da5f88
"""

let package = Package(
    name: "ANGoogleAdapter",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v15)
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
