//
//  AddEasyType.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/10.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import Foundation
import CoreFramework

enum AddEasyType {
    case ADD
    case INPUT
    
    func viewHeight() -> CGFloat {
        switch self {
        case .ADD:
            return 48
        case .INPUT:
            return 80
        }
    }
}


enum FoldState {
    case IN
    case OUT
}
