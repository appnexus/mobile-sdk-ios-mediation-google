// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let sdkVersion = "9.12.1"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"
let googleAdapterChecksum = "99e764f706b3a1c31580368601036022436a1733d06885b003d9878dbd109c23"

let package = Package(
    name: "ANGoogleAdapter",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .googleAdapter
    ],
    dependencies: [
        .package(name: "GoogleMobileAds", url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .exact("12.8.0"))
    ],
    targets: [
        .googleAdapter
    ]
)

extension Product {
    static let googleAdapter = library(name: "ANGoogleAdapter", targets: ["ANGoogleAdapter"])
}

extension Target {
    static let googleAdapter = binaryTarget(
        name: "ANGoogleAdapter",
        url: "\(baseUrl)/\(sdkVersion)/static/ANGoogleAdapter.zip",
        checksum: googleAdapterChecksum
      )
}
