//
//  MonthlyModel.swift
//  FeatureFamework
//
//  Created by hyunjin on 2024/01/05.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import Foundation

public struct MonthlyModel: CalendarModelProtocol, CustomStringConvertible {
    public var description: String {
        return "This is MonthlyModel Data : \(month)"
    }
    
    let year: Int
    let month: Month
    
    init(year: Int, month: Int) {
        self.year = year
        self.month = Month(rawValue: month)!
    }
}
