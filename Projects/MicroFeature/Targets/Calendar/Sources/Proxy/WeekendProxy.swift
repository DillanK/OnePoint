//
//  WeekendProxy.swift
//  CalendarFramework
//
//  Created by Jin Salon on 3/1/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit

public protocol WeekendProxy {
    func view() -> UIView
    func weekendHeight() -> CGFloat
    func weekendInfo(
        year: Int, month: Int, day: Int,
        callbackSelected: @escaping (_ year: Int, _ month: Int, _ day: Int, _ weekend: Int) -> (),
        callbackChangeMonth: @escaping (_ year: Int, _ month: Int) -> ())
}
