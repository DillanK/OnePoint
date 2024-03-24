//
//  DailyModel.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/28.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import Foundation
import BaseFramework

public struct DailyModel: BaseModel, CalendarModelProtocol, CustomStringConvertible {
    public var description: String {
        return "DailyModel Value(" +
        "year : \(year) " +
        "month : \(month) " +
        "day: \(day) " +
        "weekend: \(weekend.localString()) " +
        "models: \(String(describing: models?.description))\n"
    }
    
    let year: Int
    let month: Month
    let day: Int
    let weekend: Weekend
    var models: [BaseModel]?
    
    init(year: Int, month: Month, day: Int, weekend: Weekend, models: [BaseModel]? = nil) {
        self.year = year
        self.month = month
        self.day = day
        self.weekend = weekend
        self.models = models
    }
    
    init(year: Int, month: Int, day: Int, weekend: Int, models: [BaseModel]? = nil) {
        self.year = year
        self.month = Month(rawValue: month)!
        self.day = day
        self.weekend = Weekend(rawValue: weekend)!
        self.models = models
    }
    
    init(date: Date, models: [BaseModel]? = nil) {
        let calendar = Calendar.current
        self.year = calendar.component(.year, from: date)
        self.month = Month(rawValue: calendar.component(.month, from: date))!
        self.day = calendar.component(.day, from: date)
        self.weekend = Weekend(rawValue: calendar.component(.weekday, from: date))!
        self.models = models
    }
    
    func convertDate() -> Date? {
        return Date.makeDate(year: year, month: month.value(), day: day)
    }
    
    func convertDailyString() -> String {
        return String(format: "%04d%02d%02d", self.year, self.month.value(), self.day)
    }
    
    func isWeekend() -> Bool {
        return (weekend == .SAT || weekend == .SUN)
    }
}
