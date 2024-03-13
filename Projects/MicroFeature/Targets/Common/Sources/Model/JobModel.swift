//
//  JobModel.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/20.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import Foundation

public struct JobModel: CustomStringConvertible {
    public var description: String {
        return "JobModel Value(Title: \(title), isComplete: \(isCompleted))"
    }
    
    public var title: String = "JOB TITLE"
    public var isCompleted: Bool = false
    
    public init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
