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
  /// 하루전
  public static let aDayAgo = BBString.tr("Localizable", "A day ago")
  /// 한달전
  public static let aMonthAgo = BBString.tr("Localizable", "A month ago")
  /// 일주일전
  public static let aWeekAgo = BBString.tr("Localizable", "A week ago")
  /// 일정추가
  public static let addSchedule = BBString.tr("Localizable", "Add Schedule")
  /// 색상
  public static let color = BBString.tr("Localizable", "Color")
  /// 날짜
  public static let date = BBString.tr("Localizable", "date")
  /// 세부사항
  public static let detail = BBString.tr("Localizable", "Detail")
  /// 직접시간설정
  public static let directTimeSetting = BBString.tr("Localizable", "Direct time setting")
  /// 매일
  public static let everyDay = BBString.tr("Localizable", "every day")
  /// 매월
  public static let everyMonth = BBString.tr("Localizable", "every month")
  /// 매주
  public static let everyWeek = BBString.tr("Localizable", "every week")
  /// 매년
  public static let everyYear = BBString.tr("Localizable", "every year")
  /// 금
  public static let fri = BBString.tr("Localizable", "FRI")
  /// 금요일
  public static let friday = BBString.tr("Localizable", "FRIDAY")
  /// 월
  public static let mon = BBString.tr("Localizable", "MON")
  /// 월요일
  public static let monday = BBString.tr("Localizable", "MONDAY")
  /// 임시박스로 이동
  public static let moveToTemporaryBox = BBString.tr("Localizable", "Move to temporary box")
  /// 없음
  public static let noReminder = BBString.tr("Localizable", "No Reminder")
  /// 없음
  public static let noRepeatedly = BBString.tr("Localizable", "No Repeatedly")
  /// 한번
  public static let once = BBString.tr("Localizable", "Once")
  /// 세부사항을 입력해주세요.
  public static let pleaseEnterYourDetails = BBString.tr("Localizable", "Please enter your details.")
  /// 일정을 입력해주세요.
  public static let pleaseEnterYourSchedule = BBString.tr("Localizable", "Please enter your schedule.")
  /// 알림
  public static let reminder = BBString.tr("Localizable", "Reminder")
  /// 반복
  public static let repeatedly = BBString.tr("Localizable", "Repeatedly")
  /// 토
  public static let sat = BBString.tr("Localizable", "SAT")
  /// 토요일
  public static let saturday = BBString.tr("Localizable", "SATURDAY")
  /// 공유
  public static let share = BBString.tr("Localizable", "share")
  /// 시작/종료시간
  public static let startEndTime = BBString.tr("Localizable", "Start/End Time")
  /// 일
  public static let sun = BBString.tr("Localizable", "SUN")
  /// 일요일
  public static let sunday = BBString.tr("Localizable", "SUNDAY")
  /// 목
  public static let thu = BBString.tr("Localizable", "THU")
  /// 목요일
  public static let thursday = BBString.tr("Localizable", "THURSDAY")
  /// 화
  public static let tue = BBString.tr("Localizable", "TUE")
  /// 화요일
  public static let tuesday = BBString.tr("Localizable", "TUESDAY")
  /// 수
  public static let wed = BBString.tr("Localizable", "WED")
  /// 수요일
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