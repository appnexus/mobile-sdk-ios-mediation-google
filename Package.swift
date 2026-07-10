// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.12.2"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let googleAdapterChecksum = """
e0279bb418aa8f69e784de48ae7ff2668f71bfbcf37c0d087c8eac8d092e44cd
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
