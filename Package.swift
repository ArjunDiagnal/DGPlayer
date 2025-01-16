// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "DGPlayer",
    platforms: [
        .iOS(.v13), // Define the platform you want to target (iOS)
    ],
    products: [
        .library(
            name: "DGPlayer",  // The name of the library
            targets: ["DGPlayer"]  // The target containing the library code
        ),
    ],
    targets: [
        // This target contains the code for the library
        .target(
            name: "DGPlayer",  // Name of the target (matches the source folder name)
            dependencies: []  // List any dependencies if needed
        )
    ]
)
