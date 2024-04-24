//
//  DailyModel.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/28.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import Foundation
import BaseFramework

public struct DailyModel: BaseModel {
    public var description: String {
        return "DailyModel Value(" +
        "year : \(year) " +
        "month : \(month) " +
        "day: \(day) " +
        "weekend: \(weekend) "
    }
    
    public let year: Int
    public let month: Int
    public let day: Int
    public let weekend: Int
    public let hour: Int
    public let minute: Int
    
    public init(year: Int, month: Int, day: Int, weekend: Int, hour: Int, minute: Int) {
        self.year = year
        self.month = month
        self.day = day
        self.weekend = weekend
        self.hour = hour
        self.minute = minute
    }
    
    public init(date: Date) {
        let calendar = Calendar.current
        self.year = calendar.component(.year, from: date)
        self.month = calendar.component(.month, from: date)
        self.day = calendar.component(.day, from: date)
        self.weekend = calendar.component(.weekday, from: date)
        self.hour = calendar.component(.hour, from: date)
        self.minute = calendar.component(.minute, from: date)
    }
    
    public func convertDate() -> Date? {
        return Date.makeDate(year: year, month: month, day: day)
    }
    
    public func convertDailyString() -> String {
        return String(format: "%04d%02d%02d", year, month, day)
    }
}
