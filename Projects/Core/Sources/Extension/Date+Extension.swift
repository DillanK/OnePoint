//
//  Date+Extension.swift
//  Core
//
//  Created by hyunjin on 2023/12/13.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import Foundation

extension Date {
    
    /// 년, 월, 일을 입력받아서 Date 형태로 반환한다.
    /// - Parameters:
    ///   - year: 년
    ///   - month: 월
    ///   - day: 일
    /// - Returns: Date 반환, 생성에 실패하면 nil 반환
    public static func makeDate(year: Int, month: Int, day: Int) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.date(from:"\(String(format: "%04d%02d%02d", year, month, day))")
    }
    
    
    /// 기준 일자에서 몇일 전(후)에 대한 일자를 계산해서 반환한다.
    /// - Parameter day: 계산하고 싶은 일수(이후는 +, 이전은 - 입력)
    /// - Returns: 계산된 값을 반환한다. 계산에 실패하면 nil 반환
    public static func calculationDay(isBefore: Bool, referenceDate: Date, day: Int) -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(byAdding: .day, value: isBefore ? -day : day, to: referenceDate)
    }
    
    
    /// 한주의 시작일자를 구한다.(일, 월, 화... 중에 일요일 일자를 구한다.)
    /// - Returns: 일요일 Date
    public func startOfWeek() -> Date {
        let calendar = Calendar.current//(identifier: .gregorian)
        return calendar.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: self).date!
    }
    
    
    /// 현재 날짜를 문자열로 반환한다.
    /// - Returns: format 형식으로 반환. 기본 값은 yyyyMMdd 형식으로 반환
    public func string(format: String = "yyyyMMdd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
