import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "MicroFeature",
    organizationName: "Beakbig",
//    options: .options(automaticSchemesOptions: .disabled),
    settings: .settings(configurations: [
        .makeSettingToFramework(target: .DEV, frameworkName: "MicroFeature"),
        .makeSettingToFramework(target: .STAGE, frameworkName: "MicroFeature"),
        .makeSettingToFramework(target: .PRODUCT, frameworkName: "MicroFeature"),
    ]),
    targets: [
        .target(
            name: "BaseFramework",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            sources: ["Targets/Base/Sources/**"],
            dependencies: [
                .project(target: "CoreFramework", path: "../Core", condition: nil)
            ]
        ),
        .target(
            name: "CalendarFramework",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            sources: ["Targets/Calendar/Sources/**"],
            dependencies: [
                .external(name: "SnapKit", condition: nil),
                .external(name: "Kingfisher", condition: nil),
                .project(target: "AssetFramework", path: "../Resource", condition: nil),
                .project(target: "LocalizeStringFramework", path: "../Resource", condition: nil),
                .project(target: "CoreFramework", path: "../Core", condition: nil),
                .project(target: "BaseFramework", path: ".", condition: nil),
            ]
        ),
        .target(
            name: "ColorPickerFramework",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            sources: ["Targets/ColorPicker/Sources/**"],
            dependencies: [
                .external(name: "SnapKit", condition: nil),
                .external(name: "Kingfisher", condition: nil)
            ]
//            settings: .settings(configurations: [
//                .makeSettingToInherited(target: .DEV),
//                .makeSettingToInherited(target: .STAGE),
//                .makeSettingToInherited(target: .PRODUCT)
//            ])
        ),
        .target(
            name: "FeatureFramework",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            sources: ["Targets/Feature/Sources/**"],
            dependencies: [
                .external(name: "SnapKit", condition: nil),
                .project(target: "CalendarFramework", path: ".", condition: nil),
                .project(target: "CoreFramework", path: "../Core", condition: nil),
                .project(target: "ScheduleFramework", path: ".", condition: nil)
            ]
//            settings: .settings(configurations: [
//                .makeSettingToInherited(target: .DEV),
//                .makeSettingToInherited(target: .STAGE),
//                .makeSettingToInherited(target: .PRODUCT)
//            ])
        ),
        .target(
            name: "ScheduleFramework",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            sources: ["Targets/Schedule/Sources/**"],
            dependencies: [
                .external(name: "SnapKit", condition: nil),
                .external(name: "Kingfisher", condition: nil),
                .project(target: "AssetFramework", path: "../Resource", condition: nil),
                .project(target: "LocalizeStringFramework", path: "../Resource", condition: nil),
                .project(target: "CoreFramework", path: "../Core", condition: nil),
                .project(target: "BaseFramework", path: ".", condition: nil),
                .project(target: "CommonFramework", path: ".", condition: nil),
            ]
//            settings: .settings(configurations: [
//                .makeSettingToInherited(target: .DEV),
//                .makeSettingToInherited(target: .STAGE),
//                .makeSettingToInherited(target: .PRODUCT)
//            ])
        ),
        .target(
            name: "CommonFramework",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            sources: ["Targets/Common/Sources/**"],
            dependencies: [
                .project(target: "BaseFramework", path: ".", condition: nil)
            ]
//            settings: .settings(configurations: [
//                .makeSettingToInherited(target: .DEV),
//                .makeSettingToInherited(target: .STAGE),
//                .makeSettingToInherited(target: .PRODUCT)
//            ])
        )
    ],
    schemes: [
        .makeSchemeToFramewok(name: "MicroFeature", info: .DEV, isHidden: true, buildAction: .buildAction(targets: [
            .project(path: ".", target: "CalendarFramework"),
            .project(path: ".", target: "ColorPickerFramework"),
            .project(path: ".", target: "FeatureFramework"),
            .project(path: ".", target: "ScheduleFramework"),
            .project(path: ".", target: "CommonFramework")
        ])),
        .makeSchemeToFramewok(name: "MicroFeature", info: .STAGE, isHidden: true, buildAction: .buildAction(targets: [
            .project(path: ".", target: "CalendarFramework"),
            .project(path: ".", target: "ColorPickerFramework"),
            .project(path: ".", target: "FeatureFramework"),
            .project(path: ".", target: "ScheduleFramework"),
            .project(path: ".", target: "CommonFramework")
        ])),
        .makeSchemeToFramewok(name: "MicroFeature", info: .PRODUCT, isHidden: true, buildAction: .buildAction(targets: [
            .project(path: ".", target: "CalendarFramework"),
            .project(path: ".", target: "ColorPickerFramework"),
            .project(path: ".", target: "FeatureFramework"),
            .project(path: ".", target: "ScheduleFramework"),
            .project(path: ".", target: "CommonFramework")
        ]))
    ]
)
