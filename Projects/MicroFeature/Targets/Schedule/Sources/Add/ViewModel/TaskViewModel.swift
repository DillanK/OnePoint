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
            case .CHANGE_TASK_START(let btnRect):
                debugPrint(#file, #function, #line)
                self.output.resSelected.send(.SELECTED_TASK_START(self.startDailyModel))
                self.output.resTaskDateTime.send(.SELECTED_RECT(btnRect))
            case .CHANGE_TASK_END(let btnRect):
                debugPrint(#file, #function, #line)
                self.output.resSelected.send(.SELECTED_TASK_END(self.endDailyModel))
                self.output.resTaskDateTime.send(.SELECTED_RECT(btnRect))
            case .UNSELECTD:
                debugPrint(#file, #function, #line)
            }
        }.store(in: &cancellable)
    }
}

extension TaskViewModel: BaseViewModelProtocol {
    enum Request {
        /// 시작일
        case CHANGE_TASK_START(CGRect)
        /// 시작일
        case CHANGE_TASK_END(CGRect)
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
    enum ResponseSelected {
        /// 시작일
        case SELECTED_TASK_START(DailyModel)
        /// 종료일
        case SELECTED_TASK_END(DailyModel)
    }
    
    enum ResponseTaskDateTime {
        case SELECTED_RECT(CGRect)
    }

    struct Input {
        let req = PassthroughSubject<Request, Never>()
    }
    
    struct Output {
        let res = PassthroughSubject<Response, Never>()
        let resSelected = PassthroughSubject<ResponseSelected, Never>()
        let resTaskDateTime = PassthroughSubject<ResponseTaskDateTime, Never>()
    }
}
