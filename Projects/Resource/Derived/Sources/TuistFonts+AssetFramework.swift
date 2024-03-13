// static let fontsTemplate = """
// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
// AssetFrameworkFontFamily
public enum BBFont {
  public enum NotoSansKR {
    public static let thin = AssetFrameworkFontConvertible(name: "NotoSansKR-Thin", family: "Noto Sans KR", path: "NotoSansKR-VariableFont_wght.ttf")
    public static let black = AssetFrameworkFontConvertible(name: "NotoSansKR-Thin_Black", family: "Noto Sans KR", path: "NotoSansKR-VariableFont_wght.ttf")
    public static let bold = AssetFrameworkFontConvertible(name: "NotoSansKR-Thin_Bold", family: "Noto Sans KR", path: "NotoSansKR-VariableFont_wght.ttf")
    public static let extraBold = AssetFrameworkFontConvertible(name: "NotoSansKR-Thin_ExtraBold", family: "Noto Sans KR", path: "NotoSansKR-VariableFont_wght.ttf")
    public static let extraLight = AssetFrameworkFontConvertible(name: "NotoSansKR-Thin_ExtraLight", family: "Noto Sans KR", path: "NotoSansKR-VariableFont_wght.ttf")
    public static let light = AssetFrameworkFontConvertible(name: "NotoSansKR-Thin_Light", family: "Noto Sans KR", path: "NotoSansKR-VariableFont_wght.ttf")
    public static let medium = AssetFrameworkFontConvertible(name: "NotoSansKR-Thin_Medium", family: "Noto Sans KR", path: "NotoSansKR-VariableFont_wght.ttf")
    public static let regular = AssetFrameworkFontConvertible(name: "NotoSansKR-Thin_Regular", family: "Noto Sans KR", path: "NotoSansKR-VariableFont_wght.ttf")
    public static let semiBold = AssetFrameworkFontConvertible(name: "NotoSansKR-Thin_SemiBold", family: "Noto Sans KR", path: "NotoSansKR-VariableFont_wght.ttf")
    public static let all: [AssetFrameworkFontConvertible] = [thin, black, bold, extraBold, extraLight, light, medium, regular, semiBold]
  }

  public enum AppleSDGothicNeo {
    public static let regular = AssetFrameworkFontConvertible(name: "AppleSDGothicNeo-regular", family: "Apple SD Gothic Neo", path: "AppleSDGothicNeo-regular.ttf")
    public static let bold = AssetFrameworkFontConvertible(name: "AppleSDGothicNeo-bold", family: "Apple SD Gothic Neo", path: "AppleSDGothicNeo-bold.ttf")
    public static let heavy = AssetFrameworkFontConvertible(name: "AppleSDGothicNeo-heavy", family: "Apple SD Gothic Neo", path: "AppleSDGothicNeo-heavy.ttf")
    public static let light = AssetFrameworkFontConvertible(name: "AppleSDGothicNeo-light", family: "Apple SD Gothic Neo", path: "AppleSDGothicNeo-light.ttf")
    public static let medium = AssetFrameworkFontConvertible(name: "AppleSDGothicNeo-medium", family: "Apple SD Gothic Neo", path: "AppleSDGothicNeo-medium.ttf")
    public static let semibold = AssetFrameworkFontConvertible(name: "AppleSDGothicNeo-semibold", family: "Apple SD Gothic Neo", path: "AppleSDGothicNeo-semibold.ttf")
    public static let thin = AssetFrameworkFontConvertible(name: "AppleSDGothicNeo-thin", family: "Apple SD Gothic Neo", path: "AppleSDGothicNeo-thin.ttf")
    public static let ultraLight = AssetFrameworkFontConvertible(name: "AppleSDGothicNeo-ultraLight", family: "Apple SD Gothic Neo", path: "AppleSDGothicNeo-ultraLight.ttf")
    public static let all: [AssetFrameworkFontConvertible] = [regular, bold, heavy, light, medium, semibold, thin, ultraLight]
  }

  public static let allCustomFonts: [AssetFrameworkFontConvertible] = [NotoSansKR.all].flatMap { $0 }
  
  public static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

public struct AssetFrameworkFontConvertible {
  public let name: String
  public let family: String
  public let path: String

  #if os(macOS)
  public typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Font = UIFont
  #endif

  public func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\\(name)' (\\(family))")
    }
    return font
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public func swiftUIFont(size: CGFloat) -> SwiftUI.Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\\(name)' (\\(family))")
    }
    #if os(macOS)
    return SwiftUI.Font.custom(font.fontName, size: font.pointSize)
    #elseif os(iOS) || os(tvOS) || os(watchOS)
    return SwiftUI.Font(font)
    #endif
  }
  #endif

  public func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return Bundle.module.url(forResource: path, withExtension: nil)
  }
}

public extension AssetFrameworkFontConvertible.Font {
  convenience init?(font: AssetFrameworkFontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(macOS)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}
// swiftlint:enable all
// swiftformat:enable all

