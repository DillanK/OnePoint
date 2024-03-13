import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "OnePoint",
    organizationName: "Beakbig",
    options: .options(automaticSchemesOptions: .disabled),
    settings: .settings(configurations: [
        .makeSettingToProject(target: .DEV),
        .makeSettingToProject(target: .STAGE),
        .makeSettingToProject(target: .PRODUCT)
    ]),
    targets: [
        .target(
            name: "OnePoint",
            destinations: .iOS,
            product: .app,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)", 
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard"
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .project(target: "FeatureFramework", path: .relativeToManifest("../MicroFeature"), condition: nil),
                .project(target: "AssetFramework", path: .relativeToManifest("../Resource"), condition: nil)
            ],
            settings: .settings(configurations: [
                .makeSettingToInherited(target: .DEV),
                .makeSettingToInherited(target: .STAGE),
                .makeSettingToInherited(target: .PRODUCT)
            ])
        ),
        .target(
            name: "OnePointTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.beakbig.OnePointTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "OnePoint")]
        ),
    ],
    schemes: [
        .makeSchemeToProject(name: "OnePoint", info: .DEV, buildAction: .buildAction(targets: [
            .project(path: ".", target: "OnePoint")
        ])),
        .makeSchemeToProject(name: "OnePoint", info: .STAGE, buildAction: .buildAction(targets: [
            .project(path: ".", target: "OnePoint")
        ])),
        .makeSchemeToProject(name: "OnePoint", info: .PRODUCT, buildAction: .buildAction(targets: [
            .project(path: ".", target: "OnePoint")
        ]))
    ]
)
