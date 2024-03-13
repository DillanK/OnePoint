// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers


    let packageSettings = PackageSettings(
        baseSettings: .settings(configurations: [
            .debug(name: ConfigurationName(stringLiteral: "DEV")),
            .debug(name: ConfigurationName(stringLiteral: "STG")),
            .release(name: ConfigurationName(stringLiteral: "PRD"))
        ])
    )
#endif

let package = Package(
    name: "OnePointSPM",
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0"),
        .package(url: "https://github.com/Snapkit/SnapKit.git", from: "5.0.1"),
    ]
)
