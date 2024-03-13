//
//  DeployTarget.swift
//  MyPlugin
//
//  Created by hyunjin on 2023/10/17.
//

public enum DeployInfo: String, Codable {
    case DEV = "DEV"
    case STAGE = "STG"
    case PRODUCT = "PRD"
    
    func name() -> String {
        switch self {
        case .DEV: return "DEV"
        case .STAGE: return "STG"
        case .PRODUCT: return "PRD"
        }
    }
    
    /// AppName 설정
    func displayName(name: String) -> String {
        switch self {
        case .DEV: return "(D)\(name)"
        case .STAGE: return "(S)\(name)"
        case .PRODUCT: return name
        }
    }
    
    /// 각 환경 별 Icon 설정
    func iconName() -> String {
        switch self {
        case .DEV: return "\(APP_ICON_NAME)_\(self.rawValue)"
        case .STAGE: return "\(APP_ICON_NAME)_\(self.rawValue)"
        case .PRODUCT: return "\(APP_ICON_NAME)_\(self.rawValue)"
        }
    }
    
    ///Package 정보 설정
    func makeIdentifier(identifierName: String) -> String {
        switch self {
        case .DEV, .STAGE: return "\(IDENTIFIER).\(self.rawValue.lowercased()).\(identifierName.lowercased())"
        case .PRODUCT: return "\(IDENTIFIER).\(identifierName.lowercased())"
        }
    }
    
    /// XCConfig 이름 반환
    func xcConfigName() -> String {
        return "\(self.rawValue).xcconfig"
    }
}
