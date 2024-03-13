//
//  Weekend.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/28.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import LocalizeStringFramework

enum Weekend: Int {
    case SUN = 1
    case MON = 2
    case TUE = 3
    case WED = 4
    case THU = 5
    case FRI = 6
    case SAT = 7
    
    func localString(isShortString: Bool = true) -> String {
        switch self {
        case .MON:
            isShortString ? BBString.mon : BBString.monday
        case .TUE:
            isShortString ? BBString.tue : BBString.tuesday
        case .WED:
            isShortString ? BBString.wed : BBString.wednesday
        case .THU:
            isShortString ? BBString.thu : BBString.thursday
        case .FRI:
            isShortString ? BBString.fri : BBString.friday
        case .SAT:
            isShortString ? BBString.sat : BBString.saturday
        case .SUN:
            isShortString ? BBString.sun : BBString.sunday
        }
    }
    
    func value() -> Int {
        return self.rawValue
    }
}
