//
//  TaskViewModel.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/31/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import Combine
import AssetFramework
import BaseFramework
import CommonFramework

class TaskViewModel: BaseViewModel {
    var input = Input()
    var output = Output()
    
    var startDailyModel: DailyModel
    var endDailyModel: DailyModel
    
    override init(_ cancellable: Set<AnyCancellable>) {
        startDailyModel = .init(date: Date())
        endDailyModel = .init(date: Date())
        
        super.init(cancellable)
    }
    
    override func bindInputCombine() {
        input.req.sink {
            switch $0 {
            case .CHANGE_TASK_START(let btnRect, let DailyModel):
                debugPrint(#file, #function, #line)
                self.output.resSelected.send(.SHOW_TASK_DATETIME_START)
                self.output.resShowSelectedDateTime.send(.SHOW_WEEKEND_TASK_START(btnRect, self.startDailyModel))
            case .CHANGE_TASK_END(let btnRect, let DailyModel):
                debugPrint(#file, #function, #line)
                self.output.resSelected.send(.SHOW_TASK_DATETIME_END)
                self.output.resShowSelectedDateTime.send(.SHOW_WEEKEND_TASK_END(btnRect, self.endDailyModel))
            case .UNSELECTD:
                debugPrint(#file, #function, #line)
            case .SELECTED_DATETIME_START(_):
                debugPrint(#file, #function, #line)
            case .SELECTED_DATETIME_END(_):
                debugPrint(#file, #function, #line)
            }
        }.store(in: &cancellable)
    }
}

extension TaskViewModel: BaseViewModelProtocol {
    enum Request {
        /// 시작일
        case CHANGE_TASK_START(CGRect, DailyModel)
        /// 시작일
        case CHANGE_TASK_END(CGRect, DailyModel)
        /// 시작일 선택 값
        case SELECTED_DATETIME_START(DailyModel)
        /// 종료일 선택 값
        case SELECTED_DATETIME_END(DailyModel)
        /// 선택을 해제한다.
        case UNSELECTD
    }
    
    /// 데이터를 저장하고 이벤트를 반환한다.
    enum Response {
        /// 시작일
        case CHANGE_TASK_START(DailyModel)
        /// 시작일
        case CHANGE_TASK_END(DailyModel)
    }
    
    /// 버튼이 선택되면 이벤트를 전달해준다.
    enum ResponseShowDateTime {
        /// 시작일
        case SHOW_TASK_DATETIME_START
        /// 종료일
        case SHOW_TASK_DATETIME_END
    }
    
    enum ResponseSelectedDateTime {
        case SHOW_WEEKEND_TASK_START(CGRect, DailyModel)
        case SHOW_WEEKEND_TASK_END(CGRect, DailyModel)
    }

    struct Input {
        let req = PassthroughSubject<Request, Never>()
    }
    
    struct Output {
        let res = PassthroughSubject<Response, Never>()
        let resSelected = PassthroughSubject<ResponseShowDateTime, Never>()
        let resShowSelectedDateTime = PassthroughSubject<ResponseSelectedDateTime, Never>()
    }
}
