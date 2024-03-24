//
//  CalendarTopViewModel.swift
//  FeatureFramework
//
//  Created by Jin Salon on 3/23/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import BaseFramework
import Combine
import Foundation

class CalendarTopViewModel: BaseViewModel {
    public var input = Input()
    public var output = Output()
    
    public override func bindInputCombine() {
        input.clickEvent
            .throttle(for: 0.2, scheduler: RunLoop.main, latest: true)
            .sink { type in
                switch type {
                case .SELECTED_DATE:
                    self.output.clickEvent.send(.NONE)
                case .SELECTED_SCHEDULE_INFO:
                    self.output.clickEvent.send(.NONE)
                case .SHOW_CALENDAR:
                    self.output.clickEvent.send(.NONE)
                case .SHOW_COMPLETE:
                    self.output.clickEvent.send(.NONE)
                case .SHOW_IN_PROGRESS:
                    self.output.clickEvent.send(.NONE)
                }
            }
            .store(in: &cancellable)
        
        input.uiEvent.sink {
            switch $0 {
            case .CHANGE_YEAR(let year):
                debugPrint(#file, #function, #line)
                self.output.uiEvent.send(.CHANGE_YEAR(year))
            }
        }.store(in: &cancellable)
    }
}

extension CalendarTopViewModel: BaseViewModelProtocol {
    enum Request {
        case SELECTED_DATE
        case SELECTED_SCHEDULE_INFO
        case SHOW_CALENDAR
        case SHOW_COMPLETE
        case SHOW_IN_PROGRESS
    }
    
    enum RequestUI {
        case CHANGE_YEAR(Int)
    }
    
    enum Response {
        case NONE
        case LOAD_SCHEDULE
        case SHOW_CALENDAR
    }
    
    enum ResponseUI {
        case CHANGE_YEAR(Int)
    }
    
    public struct Input {
        let clickEvent = PassthroughSubject<Request, Never>()
        let uiEvent = PassthroughSubject<RequestUI, Never>()
    }
    
    public struct Output {
        let clickEvent = PassthroughSubject<Response, Never>()
        let uiEvent = PassthroughSubject<ResponseUI, Never>()
    }
}
