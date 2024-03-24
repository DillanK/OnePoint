// swiftformat:disable wrap
// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
  import Foundation
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
  import Foundation
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
	
public enum BBColor: String, CaseIterable {	
	case clear = "Clear" // {accessModifier}} static let clear = AssetFrameworkColors(name: "Clear")
	case deepSkyBlue = "DeepSkyBlue" // {accessModifier}} static let deepSkyBlue = AssetFrameworkColors(name: "DeepSkyBlue")
	case grapefruit = "Grapefruit" // {accessModifier}} static let grapefruit = AssetFrameworkColors(name: "Grapefruit")
	case black = "black" // {accessModifier}} static let black = AssetFrameworkColors(name: "black")
	case black17 = "black17" // {accessModifier}} static let black17 = AssetFrameworkColors(name: "black17")
	case black51 = "black51" // {accessModifier}} static let black51 = AssetFrameworkColors(name: "black51")
	case brownGrey = "brownGrey" // {accessModifier}} static let brownGrey = AssetFrameworkColors(name: "brownGrey")
	case buttonBlack = "buttonBlack" // {accessModifier}} static let buttonBlack = AssetFrameworkColors(name: "buttonBlack")
	case clearBlue = "clearBlue" // {accessModifier}} static let clearBlue = AssetFrameworkColors(name: "clearBlue")
	case homeBackground = "homeBackground" // {accessModifier}} static let homeBackground = AssetFrameworkColors(name: "homeBackground")
	case paleGrey = "paleGrey" // {accessModifier}} static let paleGrey = AssetFrameworkColors(name: "paleGrey")
	case random = "random" // {accessModifier}} static let random = AssetFrameworkColors(name: "random")
	case scheduleJob = "scheduleJob" // {accessModifier}} static let scheduleJob = AssetFrameworkColors(name: "scheduleJob")
	case scheduleJobDisable = "scheduleJobDisable" // {accessModifier}} static let scheduleJobDisable = AssetFrameworkColors(name: "scheduleJobDisable")
	case scheduleTime = "scheduleTime" // {accessModifier}} static let scheduleTime = AssetFrameworkColors(name: "scheduleTime")
	case scheduleTimeDisable = "scheduleTimeDisable" // {accessModifier}} static let scheduleTimeDisable = AssetFrameworkColors(name: "scheduleTimeDisable")
	case scheduleTitle = "scheduleTitle" // {accessModifier}} static let scheduleTitle = AssetFrameworkColors(name: "scheduleTitle")
	case scheduleTitleDisable = "scheduleTitleDisable" // {accessModifier}} static let scheduleTitleDisable = AssetFrameworkColors(name: "scheduleTitleDisable")
	case selectedDate = "selectedDate" // {accessModifier}} static let selectedDate = AssetFrameworkColors(name: "selectedDate")
	case selectedScheduleCount = "selectedScheduleCount" // {accessModifier}} static let selectedScheduleCount = AssetFrameworkColors(name: "selectedScheduleCount")
	case selectedScheduleLine = "selectedScheduleLine" // {accessModifier}} static let selectedScheduleLine = AssetFrameworkColors(name: "selectedScheduleLine")
	case selectedSchedulePrevNext = "selectedSchedulePrevNext" // {accessModifier}} static let selectedSchedulePrevNext = AssetFrameworkColors(name: "selectedSchedulePrevNext")
	case selectedScheduleType = "selectedScheduleType" // {accessModifier}} static let selectedScheduleType = AssetFrameworkColors(name: "selectedScheduleType")
	case selectedScheduleWeekday = "selectedScheduleWeekday" // {accessModifier}} static let selectedScheduleWeekday = AssetFrameworkColors(name: "selectedScheduleWeekday")
	case todayBackground = "todayBackground" // {accessModifier}} static let todayBackground = AssetFrameworkColors(name: "todayBackground")
	case todayBorder = "todayBorder" // {accessModifier}} static let todayBorder = AssetFrameworkColors(name: "todayBorder")
	case todayText = "todayText" // {accessModifier}} static let todayText = AssetFrameworkColors(name: "todayText")
	case veryLightPink187 = "veryLightPink187" // {accessModifier}} static let veryLightPink187 = AssetFrameworkColors(name: "veryLightPink187")
	case veryLightPink226 = "veryLightPink226" // {accessModifier}} static let veryLightPink226 = AssetFrameworkColors(name: "veryLightPink226")
	case white = "white" // {accessModifier}} static let white = AssetFrameworkColors(name: "white")
	
	public func color() -> UIColor {
        return AssetFrameworkColors(name: self.rawValue).color
	}
	
	public func swiftUIColor() -> SwiftUI.Color {
		AssetFrameworkColors(name: self.rawValue).swiftUIColor
	}
	
	public func randomColor() -> UIColor {
        return UIColor(red: CGFloat.random(in: 0.0...1.0),
                       green: CGFloat.random(in: 0.0...1.0),
                       blue: CGFloat.random(in: 0.0...1.0),
                       alpha: 1.0)
    }
    
}
	
public enum BBImage: String {	  
	case colorSpace = "ColorSpace" //public static let colorSpace = AssetFrameworkImages(name: "ColorSpace")
	case bgMenuBigOn = "bg_menu_big_on" //public static let bgMenuBigOn = AssetFrameworkImages(name: "bg_menu_big_on")
	case btnAdd = "btnAdd" //public static let btnAdd = AssetFrameworkImages(name: "btnAdd")
	case btnBtnCheckDis = "btnBtnCheckDis" //public static let btnBtnCheckDis = AssetFrameworkImages(name: "btnBtnCheckDis")
	case btnBtnCheckOff = "btnBtnCheckOff" //public static let btnBtnCheckOff = AssetFrameworkImages(name: "btnBtnCheckOff")
	case btnBtnCheckOn = "btnBtnCheckOn" //public static let btnBtnCheckOn = AssetFrameworkImages(name: "btnBtnCheckOn")
	case btnClosePopup = "btnClosePopup" //public static let btnClosePopup = AssetFrameworkImages(name: "btnClosePopup")
	case btnColorSeleted = "btnColorSeleted" //public static let btnColorSeleted = AssetFrameworkImages(name: "btnColorSeleted")
	case btnDayBefore = "btnDayBefore" //public static let btnDayBefore = AssetFrameworkImages(name: "btnDayBefore")
	case btnDayNext = "btnDayNext" //public static let btnDayNext = AssetFrameworkImages(name: "btnDayNext")
	case btnDeleteHeader = "btnDeleteHeader" //public static let btnDeleteHeader = AssetFrameworkImages(name: "btnDeleteHeader")
	case btnHeaderSearch = "btnHeaderSearch" //public static let btnHeaderSearch = AssetFrameworkImages(name: "btnHeaderSearch")
	case btnInputCalendar = "btnInputCalendar" //public static let btnInputCalendar = AssetFrameworkImages(name: "btnInputCalendar")
	case btnInputTime = "btnInputTime" //public static let btnInputTime = AssetFrameworkImages(name: "btnInputTime")
	case btnMenuMonth = "btnMenuMonth" //public static let btnMenuMonth = AssetFrameworkImages(name: "btnMenuMonth")
	case btnSetup = "btnSetup" //public static let btnSetup = AssetFrameworkImages(name: "btnSetup")
	case iconInputAdd = "iconInputAdd" //public static let iconInputAdd = AssetFrameworkImages(name: "iconInputAdd")
	case iconInputDeelete = "iconInputDeelete" //public static let iconInputDeelete = AssetFrameworkImages(name: "iconInputDeelete")
	case iconInputDelete = "iconInputDelete" //public static let iconInputDelete = AssetFrameworkImages(name: "iconInputDelete")
	case iconInputEdit = "iconInputEdit" //public static let iconInputEdit = AssetFrameworkImages(name: "iconInputEdit")
	
	public func image() -> UIImage {
		AssetFrameworkImages(name: self.rawValue).image
	}
	
	public func swiftUIImage() -> SwiftUI.Image {
		AssetFrameworkImages(name: self.rawValue).swiftUIImage
	}
}
	
public enum BBPastelColor: String, CaseIterable {	
	case c2E279D = "C2E279D" // {accessModifier}} static let c2E279D = AssetFrameworkColors(name: "C2E279D")
	case c4D80E4 = "C4D80E4" // {accessModifier}} static let c4D80E4 = AssetFrameworkColors(name: "C4D80E4")
	case c520556 = "C520556" // {accessModifier}} static let c520556 = AssetFrameworkColors(name: "C520556")
	case cb1D3C5 = "CB1D3C5" // {accessModifier}} static let cb1D3C5 = AssetFrameworkColors(name: "CB1D3C5")
	case cc70039 = "CC70039" // {accessModifier}} static let cc70039 = AssetFrameworkColors(name: "CC70039")
	case ccfdd8E = "CCFDD8E" // {accessModifier}} static let ccfdd8E = AssetFrameworkColors(name: "CCFDD8E")
	case cd18063 = "CD18063" // {accessModifier}} static let cd18063 = AssetFrameworkColors(name: "CD18063")
	case ce789C5 = "CE789C5" // {accessModifier}} static let ce789C5 = AssetFrameworkColors(name: "CE789C5")
	case cf0E4D4 = "CF0E4D4" // {accessModifier}} static let cf0E4D4 = AssetFrameworkColors(name: "CF0E4D4")
	case cf5Ddad = "CF5DDAD" // {accessModifier}} static let cf5Ddad = AssetFrameworkColors(name: "CF5DDAD")
	case cf9D9Ca = "CF9D9CA" // {accessModifier}} static let cf9D9Ca = AssetFrameworkColors(name: "CF9D9CA")
	case cff5733 = "CFF5733" // {accessModifier}} static let cff5733 = AssetFrameworkColors(name: "CFF5733")
	case cffc300 = "CFFC300" // {accessModifier}} static let cffc300 = AssetFrameworkColors(name: "CFFC300")
	case creme = "creme" // {accessModifier}} static let creme = AssetFrameworkColors(name: "creme")
	case eggShell = "eggShell" // {accessModifier}} static let eggShell = AssetFrameworkColors(name: "eggShell")
	case lightPeach = "lightPeach" // {accessModifier}} static let lightPeach = AssetFrameworkColors(name: "lightPeach")
	case lightPeriwinkle = "lightPeriwinkle" // {accessModifier}} static let lightPeriwinkle = AssetFrameworkColors(name: "lightPeriwinkle")
	case lightPeriwinkle2 = "lightPeriwinkle2" // {accessModifier}} static let lightPeriwinkle2 = AssetFrameworkColors(name: "lightPeriwinkle2")
	case pale = "pale" // {accessModifier}} static let pale = AssetFrameworkColors(name: "pale")
	case paleCyan = "paleCyan" // {accessModifier}} static let paleCyan = AssetFrameworkColors(name: "paleCyan")
	case paleLavender = "paleLavender" // {accessModifier}} static let paleLavender = AssetFrameworkColors(name: "paleLavender")
	case powderPink = "powderPink" // {accessModifier}} static let powderPink = AssetFrameworkColors(name: "powderPink")
	case veryLightBlue = "veryLightBlue" // {accessModifier}} static let veryLightBlue = AssetFrameworkColors(name: "veryLightBlue")
	case veryLightBlue2 = "veryLightBlue2" // {accessModifier}} static let veryLightBlue2 = AssetFrameworkColors(name: "veryLightBlue2")
	case veryLightGreen = "veryLightGreen" // {accessModifier}} static let veryLightGreen = AssetFrameworkColors(name: "veryLightGreen")
	
	public func color() -> UIColor {
        return AssetFrameworkColors(name: self.rawValue).color
	}
	
	public func swiftUIColor() -> SwiftUI.Color {
		AssetFrameworkColors(name: self.rawValue).swiftUIColor
	}
	
	public func randomColor() -> UIColor {
        return UIColor(red: CGFloat.random(in: 0.0...1.0),
                       green: CGFloat.random(in: 0.0...1.0),
                       blue: CGFloat.random(in: 0.0...1.0),
                       alpha: 1.0)
    }
    
}
	
public enum BBSymbole: String, CaseIterable {	  	
    case accessbility = "Accessbility" // public static let accessbility = AssetFrameworkData(name: "Accessbility")
    case arrows = "Arrows" // public static let arrows = AssetFrameworkData(name: "Arrows")
    case automotive = "Automotive" // public static let automotive = AssetFrameworkData(name: "Automotive")
    case cameraPhotos = "Camera&Photos" // public static let cameraPhotos = AssetFrameworkData(name: "Camera&Photos")
    case commerce = "Commerce" // public static let commerce = AssetFrameworkData(name: "Commerce")
    case communication = "Communication" // public static let communication = AssetFrameworkData(name: "Communication")
    case connectivity = "Connectivity" // public static let connectivity = AssetFrameworkData(name: "Connectivity")
    case devices = "Devices" // public static let devices = AssetFrameworkData(name: "Devices")
    case editing = "Editing" // public static let editing = AssetFrameworkData(name: "Editing")
    case fitness = "Fitness" // public static let fitness = AssetFrameworkData(name: "Fitness")
    case gaming = "Gaming" // public static let gaming = AssetFrameworkData(name: "Gaming")
    case health = "Health" // public static let health = AssetFrameworkData(name: "Health")
    case home = "Home" // public static let home = AssetFrameworkData(name: "Home")
    case human = "Human" // public static let human = AssetFrameworkData(name: "Human")
    case indices = "Indices" // public static let indices = AssetFrameworkData(name: "Indices")
    case keyboard = "Keyboard" // public static let keyboard = AssetFrameworkData(name: "Keyboard")
    case maps = "Maps" // public static let maps = AssetFrameworkData(name: "Maps")
    case math = "Math" // public static let math = AssetFrameworkData(name: "Math")
    case media = "Media" // public static let media = AssetFrameworkData(name: "Media")
    case nature = "Nature" // public static let nature = AssetFrameworkData(name: "Nature")
    case objectsTools = "Objects&Tools" // public static let objectsTools = AssetFrameworkData(name: "Objects&Tools")
    case privacySecurity = "Privacy&Security" // public static let privacySecurity = AssetFrameworkData(name: "Privacy&Security")
    case shapes = "Shapes" // public static let shapes = AssetFrameworkData(name: "Shapes")
    case textFormatting = "TextFormatting" // public static let textFormatting = AssetFrameworkData(name: "TextFormatting")
    case time = "Time" // public static let time = AssetFrameworkData(name: "Time")
    case transportation = "Transportation" // public static let transportation = AssetFrameworkData(name: "Transportation")
    case weather = "Weather" // public static let weather = AssetFrameworkData(name: "Weather")
	
    public func load() -> Data {
        AssetFrameworkData(name: self.rawValue).data.data
    }
    
    public func loadToArray() -> [String]? {
        return try? JSONDecoder().decode(Array<String>.self, from: load())
    }
}

// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class AssetFrameworkColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
	guard let color = Color(asset: self) else {
	  fatalError("Unable to load color asset named \\(name).")
	}
	return color
  }()

  #if canImport(SwiftUI)
  private var _swiftUIColor: Any? = nil
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) var swiftUIColor: SwiftUI.Color {
	get {
	  if self._swiftUIColor == nil {
		self._swiftUIColor = SwiftUI.Color(asset: self)
	  }

	  return self._swiftUIColor as! SwiftUI.Color
	}
	set {
	  self._swiftUIColor = newValue
	}
  }
  #endif

  fileprivate init(name: String) {
	self.name = name
  }
}

public extension AssetFrameworkColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: AssetFrameworkColors) {
	let bundle = AssetFrameworkResources.bundle
	#if os(iOS) || os(tvOS)
	self.init(named: asset.name, in: bundle, compatibleWith: nil)
	#elseif os(macOS)
	self.init(named: NSColor.Name(asset.name), bundle: bundle)
	#elseif os(watchOS)
	self.init(named: asset.name)
	#endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: AssetFrameworkColors) {
	let bundle = AssetFrameworkResources.bundle
	self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct AssetFrameworkData {
  public fileprivate(set) var name: String

  #if os(iOS) || os(tvOS) || os(macOS)
  @available(iOS 9.0, macOS 10.11, *)
  public var data: NSDataAsset {
	guard let data = NSDataAsset(asset: self) else {
	  fatalError("Unable to load data asset named \\(name).")
	}
	return data
  }
  #endif
}

#if os(iOS) || os(tvOS) || os(macOS)
@available(iOS 9.0, macOS 10.11, *)
public extension NSDataAsset {
  convenience init?(asset: AssetFrameworkData) {
	let bundle = AssetFrameworkResources.bundle
	#if os(iOS) || os(tvOS)
	self.init(name: asset.name, bundle: bundle)
	#elseif os(macOS)
	self.init(name: NSDataAsset.Name(asset.name), bundle: bundle)
	#endif
  }
}
#endif

public struct AssetFrameworkImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
	let bundle = AssetFrameworkResources.bundle
	#if os(iOS) || os(tvOS)
	let image = Image(named: name, in: bundle, compatibleWith: nil)
	#elseif os(macOS)
	let image = bundle.image(forResource: NSImage.Name(name))
	#elseif os(watchOS)
	let image = Image(named: name)
	#endif
	guard let result = image else {
	  fatalError("Unable to load image asset named \\(name).")
	}
	return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
	SwiftUI.Image(asset: self)
  }
  #endif
}

public extension AssetFrameworkImages.Image {
  @available(macOS, deprecated,
	message: "This initializer is unsafe on macOS, please use the AssetFrameworkImages.image property")
  convenience init?(asset: AssetFrameworkImages) {
	#if os(iOS) || os(tvOS)
	let bundle = AssetFrameworkResources.bundle
	self.init(named: asset.name, in: bundle, compatibleWith: nil)
	#elseif os(macOS)
	self.init(named: NSImage.Name(asset.name))
	#elseif os(watchOS)
	self.init(named: asset.name)
	#endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: AssetFrameworkImages) {
	let bundle = AssetFrameworkResources.bundle
	self.init(asset.name, bundle: bundle)
  }

  init(asset: AssetFrameworkImages, label: Text) {
	let bundle = AssetFrameworkResources.bundle
	self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: AssetFrameworkImages) {
	let bundle = AssetFrameworkResources.bundle
	self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
