//
//  InitViewModel.swift
//  FeatureFamework
//
//  Created by hyunjin on 2024/01/03.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import Foundation
import Combine

public class InitViewModel: BaseViewModel {
    public var input = Input()
    public var output = Output()
}

extension InitViewModel: BaseViewModelProtocol {
    enum Request {
        case bindView
        case bindEvent
        case bindCombine
    }
    
    enum RequestThrottleGuard {
        case bindConstraint(_ isAdjustWindow: Bool)
    }
    
    public struct Input {
        let request = PassthroughSubject<Request, Never>()
        let requestThrottleGuard = PassthroughSubject<RequestThrottleGuard, Never>()
    }
    
    public struct Output { }
}
