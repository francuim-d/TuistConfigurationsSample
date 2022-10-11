import ProjectDescription
import ProjectDescriptionHelpers

let name = "TuistConfigurationsSample"

let schemes = [
    Scheme.scheme(
        name: "Dev",
        targetName: name,
        xcconfigDebug: "Configurations/Dev-Debug.xcconfig",
        xcconfigRelease: "Configurations/Dev-Release.xcconfig"
    ),
    Scheme.scheme(
        name: "Prod",
        targetName: name,
        xcconfigDebug: "Configurations/Prod-Debug.xcconfig",
        xcconfigRelease: "Configurations/Prod-Release.xcconfig"
    ),
]

let appTarget = Target(
    name: name,
    platform: .iOS,
    product: .app,
    productName: name,
    bundleId: "com.francium.TuistConfigurationsSample",
    deploymentTarget: .iOS(targetVersion: "13.0", devices: .iphone),
    sources: ["TuistConfigurationsSample/**/*.swift"],
    resources: ["TuistConfigurationsSample/Resources/**"],
    copyFiles: nil,
    headers: nil,
    entitlements: nil,
    scripts: [],
    dependencies: [
        .external(name: "Alamofire"),
        .external(name: "FirebaseCrashlytics")
    ],
    settings: nil,
    coreDataModels: [],
    environment: [:],
    launchArguments: [],
    additionalFiles: []
)

let project = Project(
    name: name,
    options: .options(
        automaticSchemesOptions: .disabled,
        textSettings: .textSettings(usesTabs: false, indentWidth: 4, wrapsLines: true),
        xcodeProjectName: name
    ),
    packages: [],
    settings: .settings(base: [:], configurations: schemes.flatMap(\.configurations), defaultSettings: .none),
    targets: [appTarget],
    schemes: schemes.map(\.scheme),
    fileHeaderTemplate: nil,
    additionalFiles: [
        .glob(pattern: .relativeToRoot("Configurations/Config.xcconfig"))
    ],
    resourceSynthesizers: [.strings(), .assets(), .fonts()]
)
