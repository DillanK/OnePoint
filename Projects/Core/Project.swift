import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Core",
    organizationName: "Beakbig",
//    options: .options(automaticSchemesOptions: .disabled),
    settings: .settings(configurations: [
        .makeSettingToFramework(target: .DEV, frameworkName: "Core"),
        .makeSettingToFramework(target: .STAGE, frameworkName: "Core"),
        .makeSettingToFramework(target: .PRODUCT, frameworkName: "Core"),
    ]),
    targets: [
        .target(
            name: "CoreFramework",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            sources: ["Sources/**"],
//            dependencies: [
//                .external(name: "SnapKit", condition: nil),
//                .external(name: "Kingfisher", condition: nil)
//            ],
            settings: .settings(configurations: [
                .makeSettingToInherited(target: .DEV),
                .makeSettingToInherited(target: .STAGE),
                .makeSettingToInherited(target: .PRODUCT)
            ])
        )
    ]
//    ,
//    schemes: [
//        .makeSchemeToFramewok(name: "Core", info: .DEV, isHidden: true, buildAction: .buildAction(targets: [
//            .project(path: ".", target: "CoreFramework")
//        ])),
//        .makeSchemeToFramewok(name: "Core", info: .STAGE, isHidden: true, buildAction: .buildAction(targets: [
//            .project(path: ".", target: "CoreFramework")
//        ])),
//        .makeSchemeToFramewok(name: "Core", info: .PRODUCT, isHidden: true, buildAction: .buildAction(targets: [
//            .project(path: ".", target: "CoreFramework")
//        ]))
//    ]
)



//let project: Project = .makeProject(
//    name: ProjectValue.CORE.rawValue,
//    targetInfos: [
//        .init(value: .CORE),
////        .init(value: .CORE_UNIT_TEST),
////        .init(value: .CORE_UI_UNIT_TEST)
//    ]
//)

//let project = Project(name: "Core",
//                      organizationName: "Beakbig",
//                      options: .options(automaticSchemesOptions: .disabled),
//                      settings: .settings(configurations: [
//                        .makeXCConfig(isDebug: true, isProject: true, type: .DEV),
//                        .makeXCConfig(isDebug: true, isProject: true, type: .STAGE),
//                        .makeXCConfig(isDebug: false, isProject: true, type: .PRODUCT)
//                      ]),
//                      targets: [
//                        Target(
//                            name: "CoreLib",
//                            platform: .iOS,
//                            product: .staticFramework,
//                            bundleId: "${inherited}",
////                            infoPlist: .file(path: "Config/info.plist"),
//                            sources: "Sources/**",
//                            resources: [
////                                "../Resource/Assets/OBImage.xcassets",
////                                "../Resource/Assets/OBAppIcon.xcassets",
////                                "Storyboard/LaunchScreen.storyboard",
////                                .glob(pattern: .relativeToRoot("Frameworks/TransKey/Library/MTransKeyRes/**")),
////                                .glob(pattern: .relativeToRoot("Frameworks/TransKey/Library/license_mtranskey.rsl"))
//                            ],
////                            dependencies: [
////                                .project(target: "FeatureLib", path: .relativeToRoot("Feature"))
////                            ]
//                            settings: .settings(configurations: [
//                                .makeXCConfig(isDebug: true, isProject: false, type: .DEV),
//                                .makeXCConfig(isDebug: true, isProject: false, type: .STAGE),
//                                .makeXCConfig(isDebug: false, isProject: false, type: .PRODUCT)
////                                .debug(name: .dev,
////                                       settings: [
////                                        "DEVELOPMENT_TEAM[sdk=iphoneos*]" : "685JTQCHGL",
////                                        "PROVISIONING_PROFILE_SPECIFIER[sdk=iphoneos*]" : "IT-EP com.ibk.ibkonemini-test-enter_20230214_DEV",
////                                        "ASSETCATALOG_COMPILER_APPICON_NAME" : "${inherited}",
////                                        "PRODUCT_NAME" : "${inherited}",
////                                        "MARKETING_VERSION" : "${inherited}",
////                                        "CURRENT_PROJECT_VERSION" : "${inherited}"
////                                       ],
////                                       xcconfig: .relativeToRoot("XCConfig/App/DEV.xcconfig")),
////                                .debug(name: .port,
////                                       settings: [
////                                        "ASSETCATALOG_COMPILER_APPICON_NAME" : "${inherited}",
////                                        "PRODUCT_NAME" : "${inherited}",
////                                        "MARKETING_VERSION" : "${inherited}",
////                                        "CURRENT_PROJECT_VERSION" : "${inherited}"
////                                       ],
////                                       xcconfig: .relativeToRoot("XCConfig/App/PORT.xcconfig")),
////                                .release(name: .distribution,
////                                         settings: [
////                                            "ASSETCATALOG_COMPILER_APPICON_NAME" : "${inherited}",
////                                            "PRODUCT_NAME" : "${inherited}",
////                                            "MARKETING_VERSION" : "${inherited}",
////                                            "CURRENT_PROJECT_VERSION" : "${inherited}"
////                                         ],
////                                         xcconfig: .relativeToRoot("XCConfig/App/DISTRIBUTION.xcconfig"))
//                            ])
//                        ),
//                        Target(
//                            name: "CoreLibTests",
//                            platform: .iOS,
//                            product: .unitTests,
//                            bundleId: "${inherited}.tests",
////                            infoPlist: "Config/tests-info.plist",
//                            sources: "Tests/**",
//                            dependencies: [
//                                .target(name: "CoreLib"),
//                            ]
////                            settings: .settings(configurations: [
////                                .debug(name: .dev,
////                                       settings: [
////                                        "ASSETCATALOG_COMPILER_APPICON_NAME" : "AppIcon_Dev"
////                                       ],
////                                       xcconfig: .relativeToRoot("XCConfig/App/DEV.xcconfig")),
////                                .debug(name: .port,
////                                       settings: [
////                                        "ASSETCATALOG_COMPILER_APPICON_NAME" : "AppIcon_Port"
////                                       ],
////                                       xcconfig: .relativeToRoot("XCConfig/App/PORT.xcconfig")),
////                                .release(name: .distribution,
////                                         settings: [
////                                          "ASSETCATALOG_COMPILER_APPICON_NAME" : "AppIcon_Distribution"
////                                         ],
////                                         xcconfig: .relativeToRoot("XCConfig/App/DISTRIBUTION.xcconfig"))
////                            ])
//                        )
//                      ],
//                      schemes: [
//                        .makeScheme(name: "${TARGET_NAME}",
//                                    info: .DEV,
//                                    buildAction: .buildAction(targets: [
//                                        .project(path: ".", target: "CoreLib")
//                                    ])),
//                        .makeScheme(name: "${TARGET_NAME}",
//                                    info: .STAGE,
//                                    buildAction: .buildAction(targets: [
//                                        .project(path: ".", target: "CoreLib")
//                                    ])),
//                        .makeScheme(name: "${TARGET_NAME}",
//                                    info: .PRODUCT,
//                                    buildAction: .buildAction(targets: [
//                                        .project(path: ".", target: "CoreLib")
//                                    ]))
//                      ],
//                      fileHeaderTemplate: nil,
//                      additionalFiles: [],
//                      resourceSynthesizers: []
//)
