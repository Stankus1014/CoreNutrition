// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreNutrition",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "CoreNutrition",
            targets: ["CoreNutrition"]
        ),
    ],
    targets: [
        .target(
            name: "CoreNutrition"
        ),

    ]
)
