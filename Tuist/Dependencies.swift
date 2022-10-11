import ProjectDescription

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(
                url: "https://github.com/Alamofire/Alamofire",
                requirement: .upToNextMajor(from: "5.6.1")
            ),
            .remote(
                url: "https://github.com/firebase/firebase-ios-sdk",
                requirement: .upToNextMajor(from: "9.0.0")
            )
        ],
        productTypes: [
            "Alamofire": .framework
        ],
        baseSettings: .settings(configurations: [
            .debug(name: "Dev-Debug"),
            .debug(name: "Prod-Debug"),
            .release(name: "Dev-Release"),
            .release(name: "Prod-Release"),
        ])
    ),
    platforms: [.iOS]
)
