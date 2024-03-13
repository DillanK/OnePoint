import ProjectDescription

extension Configuration {
    public static func makeSettingToProject(target: DeployInfo) -> Self {
        switch target {
        case .DEV, .STAGE:
            return .debug(name: name(target), settings: .project(target), xcconfig: xcConfigPath(target))
        case .PRODUCT:
            return .release(name: name(target), settings: .project(target), xcconfig: xcConfigPath(target))
        }
    }
    
    public static func makeSettingToFramework(target: DeployInfo, frameworkName: String) -> Self {
        switch target {
        case .DEV, .STAGE:
            return .debug(name: name(target), settings: .framework(target, frameworkName), xcconfig: xcConfigPath(target))
        case .PRODUCT:
            return .release(name: name(target), settings: .framework(target, frameworkName), xcconfig: xcConfigPath(target))
        }
    }
    
    public static func makeSettingToInherited(target: DeployInfo) -> Self {
        switch target {
        case .DEV, .STAGE:
            return .debug(name: name(target), settings: .inheritedSetting(target), xcconfig: xcConfigPath(target))
        case .PRODUCT:
            return .release(name: name(target), settings: .inheritedSetting(target), xcconfig: xcConfigPath(target))
        }
    }
    
    private static func name(_ target: DeployInfo) -> ConfigurationName {
        .configuration(target.name())
    }
    
    private static func xcConfigPath(_ target: DeployInfo) -> ProjectDescription.Path {
        return "XCConfig/\(target.xcConfigName())"
    }
}
