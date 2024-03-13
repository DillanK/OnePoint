//
//  SelectedDateViewModel.swift
//  FeatureFramework
//
//  Created by Jin Salon on 3/4/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import Foundation
import BaseFramework
import Combine

public class SelectedDateViewModel: BaseViewModel {
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
    }
}

extension SelectedDateViewModel: BaseViewModelProtocol {
    enum Request {
        case SELECTED_DATE
        case SELECTED_SCHEDULE_INFO
        case SHOW_CALENDAR
        case SHOW_COMPLETE
        case SHOW_IN_PROGRESS
    }
    
    enum Response {
        case NONE
        case LOAD_SCHEDULE
        case SHOW_CALENDAR
    }
    
    public struct Input {
        let clickEvent = PassthroughSubject<Request, Never>()
    }
    
    public struct Output {
        let clickEvent = PassthroughSubject<Response, Never>()
    }
}

extension SelectedDateViewModel {
    enum AttributeType {
        case COMPLETE
        case IN_PROGRESS
        
        func text() -> String {
            switch self {
            case .COMPLETE:
                return "완료건수"
            case .IN_PROGRESS:
                return "일정건수"
            }
        }
    }
    
    private func makeScheduleAttribute(type: AttributeType, count: Int) {
        
    }
}
