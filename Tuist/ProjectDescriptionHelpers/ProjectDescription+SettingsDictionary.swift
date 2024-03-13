import ProjectDescription

public extension SettingsDictionary {
    static func project(_ target: DeployInfo) -> Self {
        return [
            "ENABLE_USER_SCRIPT_SANDBOXING" : "YES",
            "ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS" : "YES",
            "ENABLE_MODULE_VERIFIER" : "YES",
            "GENERATE_INFOPLIST_FILE" : "YES",
            "PRODUCT_NAME" : .string(target.displayName(name: APPLICATION_NAME)),
            "PRODUCT_BUNDLE_IDENTIFIER" : .string(target.makeIdentifier(identifierName: APPLICATION_NAME)),
            "ASSETCATALOG_COMPILER_APPICON_NAME" : .string(target.iconName()),
            "INFOPLIST_KEY_CFBundleDisplayName" : "$(PRODUCT_NAME)"
           ]
    }
    
    static func framework(_ target: DeployInfo, _ name: String) -> Self {
        return [
            "ENABLE_USER_SCRIPT_SANDBOXING" : "YES",
            "ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS" : "YES",
            "ENABLE_MODULE_VERIFIER" : "YES",
            "GENERATE_INFOPLIST_FILE" : "YES",
            "PRODUCT_NAME" : .string(target.displayName(name: name)),
            "PRODUCT_BUNDLE_IDENTIFIER" : .string(target.makeIdentifier(identifierName: "\(APPLICATION_NAME).\(name)")),
            "INFOPLIST_KEY_CFBundleDisplayName" : "$(PRODUCT_NAME)"
           ]
    }
    
    static func inheritedSetting(_ target: DeployInfo) -> Self {
        return [
            "ASSETCATALOG_COMPILER_APPICON_NAME" : "${inherited}",
//            "PRODUCT_NAME" : "${inherited}",
//            "MARKETING_VERSION" : "${inherited}",
//            "CURRENT_PROJECT_VERSION" : "${inherited}",
            "CODE_SIGN_STYLE" : "Manual",
            "PRODUCT_BUNDLE_IDENTIFIER" : "${inherited}"
            // 아래는 Provisioning Profile 정보를 셋팅하는 경우 이용
//            "PROVISIONING_PROFILE_SPECIFIER" : "Wildcard Beakbig"
//            "DEVELOPMENT_TEAM" : "3L7K9287C3"
        ]
    }
}
