//
//  ResponeLocalCalendar.swift
//  FeatureFamework
//
//  Created by hyunjin on 2024/01/04.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import Foundation

enum LocalCalendar {
    case LOAD_MONTHLY_DATA
    case ADD_DAYILY_DATA
}

enum LocalCalendarError: Error {
    case SUCCESS
    case FAIL_LOAD_MONTHLY_DATA
    case FAIL_ADD_DAYILY_DATA
}
