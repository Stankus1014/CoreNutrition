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
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.8.0")
    ],
    targets: [
        .target(
            name: "CoreNutrition",
            dependencies: [
                .product(name: "Kingfisher", package: "Kingfisher")
            ],
            resources: [
                .process("Foods/foods.csv")
            ]
        ),

    ]
)
