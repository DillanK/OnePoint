//
//  ScheduleModel.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 4/2/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import Foundation

struct ScheduleModel {
    var title: String
    var startDateTime: Date
    var endDateTime: Date
    var reminder: Int
    var repeatedly: Int
    var jobs: [String]?
    var shares: [String]?
    
    init(title: String = "",
         startDateTime: Date = Date(),
         endDateTime: Date = Date(),
         reminder: Int = 0,
         repeatedly: Int = 0,
         jobs: [String]? = nil,
         shares: [String]? = nil) {
        self.title = title
        self.startDateTime = startDateTime
        self.endDateTime = endDateTime
        self.reminder = reminder
        self.repeatedly = repeatedly
        self.jobs = jobs
        self.shares = shares
    }
}
