// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum BBString {
  /// day
  public static let aDayAgo = BBString.tr("Localizable", "A day ago")
  /// month
  public static let aMonthAgo = BBString.tr("Localizable", "A month ago")
  /// week
  public static let aWeekAgo = BBString.tr("Localizable", "A week ago")
  /// Add Schedule
  public static let addSchedule = BBString.tr("Localizable", "Add Schedule")
  /// Color
  public static let color = BBString.tr("Localizable", "Color")
  /// date
  public static let date = BBString.tr("Localizable", "date")
  /// Detail
  public static let detail = BBString.tr("Localizable", "Detail")
  /// setting
  public static let directTimeSetting = BBString.tr("Localizable", "Direct time setting")
  /// day
  public static let everyDay = BBString.tr("Localizable", "every day")
  /// month
  public static let everyMonth = BBString.tr("Localizable", "every month")
  /// week
  public static let everyWeek = BBString.tr("Localizable", "every week")
  /// year
  public static let everyYear = BBString.tr("Localizable", "every year")
  /// FRI
  public static let fri = BBString.tr("Localizable", "FRI")
  /// FRIDAY
  public static let friday = BBString.tr("Localizable", "FRIDAY")
  /// MON
  public static let mon = BBString.tr("Localizable", "MON")
  /// MONDAY
  public static let monday = BBString.tr("Localizable", "MONDAY")
  /// Move to temporary box
  public static let moveToTemporaryBox = BBString.tr("Localizable", "Move to temporary box")
  /// no
  public static let noReminder = BBString.tr("Localizable", "No Reminder")
  /// No Repeatedly
  public static let noRepeatedly = BBString.tr("Localizable", "No Repeatedly")
  /// Once
  public static let once = BBString.tr("Localizable", "Once")
  /// Please enter your details.
  public static let pleaseEnterYourDetails = BBString.tr("Localizable", "Please enter your details.")
  /// Please enter your schedule.
  public static let pleaseEnterYourSchedule = BBString.tr("Localizable", "Please enter your schedule.")
  /// Reminder
  public static let reminder = BBString.tr("Localizable", "Reminder")
  /// Repeatedly
  public static let repeatedly = BBString.tr("Localizable", "Repeatedly")
  /// SAT
  public static let sat = BBString.tr("Localizable", "SAT")
  /// SATURDAY
  public static let saturday = BBString.tr("Localizable", "SATURDAY")
  /// Share
  public static let share = BBString.tr("Localizable", "Share")
  /// Start/End Time
  public static let startEndTime = BBString.tr("Localizable", "Start/End Time")
  /// SUN
  public static let sun = BBString.tr("Localizable", "SUN")
  /// SUNDAY
  public static let sunday = BBString.tr("Localizable", "SUNDAY")
  /// THU
  public static let thu = BBString.tr("Localizable", "THU")
  /// THURSDAY
  public static let thursday = BBString.tr("Localizable", "THURSDAY")
  /// TUE
  public static let tue = BBString.tr("Localizable", "TUE")
  /// TUESDAY
  public static let tuesday = BBString.tr("Localizable", "TUESDAY")
  /// WED
  public static let wed = BBString.tr("Localizable", "WED")
  /// WEDNESDAY
  public static let wednesday = BBString.tr("Localizable", "WEDNESDAY")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension BBString {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = LocalizeStringFrameworkResources.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
// swiftlint:enable all
// swiftformat:enable all