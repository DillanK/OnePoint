import ProjectDescription

extension Scheme {
    public static func makeSchemeToProject(name: String,
                                           info: DeployInfo,
                                           isShared: Bool = true,
                                           isHidden: Bool = false,
                                           buildAction: BuildAction? = nil,
                                           testAction: TestAction? = nil) -> Self {
        scheme(name: "\(name)_\(info.name())",
              shared: isShared,
              hidden: isHidden,
              buildAction: buildAction,
              testAction: testAction,
              runAction: .runAction(configuration: .configuration(info.rawValue)),
              archiveAction: .archiveAction(configuration: .configuration(info.rawValue)),
              profileAction: .profileAction(configuration: .configuration(info.rawValue)),
              analyzeAction: .analyzeAction(configuration: .configuration(info.rawValue)))
    }
    
    public static func makeSchemeToFramewok(name: String,
                                            info: DeployInfo,
                                            isShared: Bool = true,
                                            isHidden: Bool = false,
                                            buildAction: BuildAction? = nil,
                                            testAction: TestAction? = nil) -> Self {
        scheme(name: "\(name)",
              shared: isShared,
              hidden: isHidden,
              buildAction: buildAction,
              testAction: testAction,
              runAction: .runAction(configuration: .configuration(info.rawValue)),
              archiveAction: .archiveAction(configuration: .configuration(info.rawValue)),
              profileAction: .profileAction(configuration: .configuration(info.rawValue)),
              analyzeAction: .analyzeAction(configuration: .configuration(info.rawValue)))
    }
}
