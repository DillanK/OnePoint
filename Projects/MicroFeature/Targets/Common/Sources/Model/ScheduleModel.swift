//
//  ScheduleModel.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/20.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import Foundation
import UIKit

public struct ScheduleModel: CustomStringConvertible {
    public var description: String {
        return "ScheduleModel Value(" +
        "SymboleColor : \(symboleColor.description)" +
        "StartTime: \(symboleColor.description)" +
        "EndTime: \(symboleColor.description)" +
        "BetweenTime: \(symboleColor.description)" +
        "Title: \(symboleColor.description)" +
        "Jobs: \(jobs))"
    }
    
    public var dailyInfo: DailyModel
    public var symboleColor: UIColor
    public var startTime: CGFloat
    public var endTime: CGFloat
    public var betweenTime: Int
    public var title: String
    public var jobs: [JobModel]?
    public var shares: [ShareModel]?
    
    public init(dailyInfo: DailyModel, symboleColor: UIColor, startTime: CGFloat, endTime: CGFloat, betweenTime: Int, title: String, jobs: [JobModel]? = nil, shares: [ShareModel]? = nil) {
        self.dailyInfo = dailyInfo
        self.symboleColor = symboleColor
        self.startTime = startTime
        self.endTime = endTime
        self.betweenTime = betweenTime
        self.title = title
        self.jobs = jobs
        self.shares = shares
    }
    
    public func timeLine() -> String {
        return "\(startTime) ~ \(endTime) (\(betweenTime))"
    }
    
    public func job() -> String {
        return "0/\(jobs?.count ?? 0)"
    }
}

