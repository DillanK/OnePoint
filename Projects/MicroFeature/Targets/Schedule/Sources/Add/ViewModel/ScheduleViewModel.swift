//
//  ScheduleViewModel.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 4/2/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import BaseFramework
import Combine
import Foundation
import UIKit

class ScheduleViewModel: BaseViewModel {
    var input = Input()
    var output = Output()
    
    override func bindInputCombine() {
//        input.req.sink {
//            switch $0 {
//            case .SELECTED_COLOR(let color):
//                self.output.res.send(.SELECTED_COLOR(color))
//            }
//        }.store(in: &cancellable)
    }
}

extension ScheduleViewModel: BaseViewModelProtocol {
    enum ChangeData {
        case CHANGE_TITLE(String)
        case CHANGE_START_DATETIME(Date)
        case CHANGE_END_DATETIME(Date)
        case CHANGE_REMINDER(Int)
        case CHANGE_REPEATEDLY(Int)
        case CHANGE_COLOR(UIColor)
        case CHANGE_JOBS([String])
        case CHANGE_SHARES([String])
    }
    
    enum Reload {
        case CHANGE_COLOR(UIColor)
    }
    
    enum Response {
//        case SELECTED_COLOR(UIColor)
    }
    
    struct Input {
        let req = PassthroughSubject<ChangeData, Never>()
    }
    
    struct Output {
        let res = PassthroughSubject<Reload, Never>()
        let resRelay = PassthroughSubject<Response, Never>()
    }
}
