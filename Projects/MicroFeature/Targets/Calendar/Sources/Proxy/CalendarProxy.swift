//
//  CalendarProxy.swift
//  CalendarFramework
//
//  Created by Jin Salon on 3/1/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import Foundation

public class CalendarProxy {
    public static func loadMonthly() -> MonthlyProxy {
        return MonthlyView.create()
    }
    
    public static func loadWeekend() -> WeekendProxy {
        return WeekendView.create()
    }
    
//    public func loadDaily() -> DailyProxy {
//        
//    }
}
