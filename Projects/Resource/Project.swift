import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Resource",
    organizationName: "Beakbig",
    options: .options(automaticSchemesOptions: .disabled),
    settings: .settings(configurations: [
        .makeSettingToFramework(target: .DEV, frameworkName: "Resource"),
        .makeSettingToFramework(target: .STAGE, frameworkName: "Resource"),
        .makeSettingToFramework(target: .PRODUCT, frameworkName: "Resource"),
    ]),
    targets: [
        .target(
            name: "AssetFramework",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            sources: ["Sources/**"],
            resources: [
                .glob(pattern: "Assets/BBImage.xcassets/**"),
                .glob(pattern: "Assets/BBColor.xcassets/**"),
                .glob(pattern: "Assets/BBPastelColor.xcassets/**"),
                .glob(pattern: "Assets/BBSymbole.xcassets/**"),
                .glob(pattern: "Assets/Font/**")
            ],
            settings: .settings(configurations: [
                .makeSettingToInherited(target: .DEV),
                .makeSettingToInherited(target: .STAGE),
                .makeSettingToInherited(target: .PRODUCT)
            ])
        ),
        .target(
            name: "LocalizeStringFramework",
            destinations: .iOS,
            product: .framework,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            sources: ["Sources/**"],
            resources: [
                .glob(pattern: "Assets/LocalizeString/**")
            ],
            settings: .settings(configurations: [
                .makeSettingToInherited(target: .DEV),
                .makeSettingToInherited(target: .STAGE),
                .makeSettingToInherited(target: .PRODUCT)
            ])
        )
    ],
    schemes: [
        .makeSchemeToFramewok(name: "Resource", info: .DEV, isHidden: true, buildAction: .buildAction(targets: [
            .project(path: ".", target: "AssetFramework"),
            .project(path: ".", target: "LocalizeStringFramework")
        ])),
        .makeSchemeToFramewok(name: "Resource", info: .STAGE, isHidden: true, buildAction: .buildAction(targets: [
            .project(path: ".", target: "AssetFramework"),
            .project(path: ".", target: "LocalizeStringFramework")
        ])),
        .makeSchemeToFramewok(name: "Resource", info: .PRODUCT, isHidden: true, buildAction: .buildAction(targets: [
            .project(path: ".", target: "AssetFramework"),
            .project(path: ".", target: "LocalizeStringFramework")
        ]))
    ]
)

//let project: Project = .makeProject(
//    name: ProjectValue.RESOURCE.rawValue,
//    targetInfos: [
//        .init(
//            value: .RESOURCE_ASSET,
//            resources: [
//                .glob(pattern: "Assets/BBImage.xcassets/**"),
//                .glob(pattern: "Assets/BBColor.xcassets/**"),
//                .glob(pattern: "Assets/BBPastelColor.xcassets/**"),
//                .glob(pattern: "Assets/BBSymbole.xcassets/**")
//            ]
//        ),
//        .init(
//            value: .RESOURCE_STRING,
//            sourcePath: [],
//            resources: [
//                .glob(pattern: "Assets/LocalizeString/**")
//            ]
//        )
//    ],
//    resourceSynthesizers: [
//        .custom(name: "Assets", parser: .assets, extensions: ["xcassets"]),
//        .strings()
//    ]
//)
