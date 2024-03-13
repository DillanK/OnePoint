//
//  ScheduleProxy.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/5/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit

public class ScheduleProxy {
    public static func loadMonthly() -> UIViewController {
        return ScheduleViewController.create()
    }
    
    public static func loadScheduleList() -> UIView {
        return ScheduleListView.create()
    }
}
