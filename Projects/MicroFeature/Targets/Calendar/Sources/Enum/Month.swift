//
//  LastDay.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/27.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import Foundation

public enum Month: Int {
    case Jan = 1
    case Feb = 2
    case Mar = 3
    case Apr = 4
    case May = 5
    case Jun = 6
    case Jul = 7
    case Aug = 8
    case Sep = 9
    case Oct = 10
    case Nov = 11
    case Dec = 12
    
    func value() -> Int {
        return self.rawValue
    }
    
    /// 월에 마지막 날을 반환한다.
    /// - Parameter year: 년도
    /// - Returns: 해당 년도 월에 해당하는 마지막 날을 반환
    func lastDay(_ year: Int) -> Int {
        switch self {
        case .Jan, .Mar, .May, .Jul, .Aug, .Oct, .Dec:
            return 31
        case .Apr, .Jun, .Sep, .Nov:
            return 30
        case .Feb:
            debugPrint("isLeapYear \(year)년 2월 \(isLeapYear(year) ? 29 : 28)")
            return isLeapYear(year) ? 29 : 28
        }
    }
    
    /// 윤년 계산
    /// - Parameter year: 계산할 년도
    /// - Returns: 윤년인경우 true 반환
    ///  1. year / 4 로 나눠떨어지면 윤년
    ///  2. 1 맞고 100으로 나눠떨어지면 윤년 아님
    ///  3. 2번에 해당하면서 year / 400 나눠떨어지면 윤년
    func isLeapYear(_ year: Int) -> Bool {
        if year % 4 == 0 {
            if year % 100 == 0 {
                if year % 400 == 0 {
                   return true
                }
            } else {
                return true
            }
        }
        
        return false
    }
}
