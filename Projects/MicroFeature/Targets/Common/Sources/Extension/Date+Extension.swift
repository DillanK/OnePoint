//
//  String+Extension.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/18/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import Foundation

public extension Date {
    static func timeStamp() -> String {
        return String(Date().timeIntervalSince1970)
    }
    
    func formatter(format: String) {
        
    }
}
