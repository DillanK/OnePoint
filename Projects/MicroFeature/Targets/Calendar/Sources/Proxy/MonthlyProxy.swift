//
//  MonthProxy.swift
//  CalendarFramework
//
//  Created by Jin Salon on 3/1/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit

public protocol MonthlyProxy {
    func view() -> UIView
    func centerDateInfo(block: @escaping (Int) -> ())
}
