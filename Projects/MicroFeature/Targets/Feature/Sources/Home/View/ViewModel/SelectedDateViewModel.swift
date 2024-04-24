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
    
    private var selectedDate: Date = Date.now
    
    public override func bindInputCombine() {
        input.observeRequest
            .throttle(for: 0.2, scheduler: RunLoop.main, latest: true)
            .sink { type in
                switch type {
                case .SELECTED_DATE(let date):
                    self.selectedDate(date)
                case .PREV_DATE:
                    self.selectedDate(Date.calculationDay(
                        isBefore: true, referenceDate: self.selectedDate, day: 1
                    ))
                case .NEXT_DATE:
                    self.selectedDate(Date.calculationDay(
                        isBefore: false, referenceDate: self.selectedDate, day: 1
                    ))
                case .SELECTED_SCHEDULE_INFO:
                    self.output.observeResponse.send(.NONE)
                case .SHOW_CALENDAR:
                    self.output.observeResponse.send(.NONE)
                case .SHOW_COMPLETE:
                    self.output.observeResponse.send(.NONE)
                case .SHOW_IN_PROGRESS:
                    self.output.observeResponse.send(.NONE)
                }
            }
            .store(in: &cancellable)
    }
}

extension SelectedDateViewModel: BaseViewModelProtocol {
    enum Request {
        case SELECTED_DATE(Date)
        case PREV_DATE
        case NEXT_DATE
        case SELECTED_SCHEDULE_INFO
        case SHOW_CALENDAR
        case SHOW_COMPLETE
        case SHOW_IN_PROGRESS
    }
    
    enum Response {
        case NONE
        case SELECTED_DATE(isToday: Bool, date: String, week: String)
        case LOAD_SCHEDULE(String, String)
        case SHOW_CALENDAR
    }
    
    public struct Input {
        let observeRequest = PassthroughSubject<Request, Never>()
    }
    
    public struct Output {
        let observeResponse = PassthroughSubject<Response, Never>()
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

extension SelectedDateViewModel {
    /// 선택된 일자
    /// - Parameter date: 선택된 일자
    func selectedDate(_ date: Date?) {
        guard let validDate = date else {
            return
        }
        
        self.selectedDate = validDate
        
        output.observeResponse.send(.SELECTED_DATE(
            isToday: validDate.string() == Date.now.string(),
            date: validDate.string(format: "yyyy.MM.dd"),
            week: validDate.string(format: "E")
        ))
        
        loadSchedule(validDate)
    }
    
    /// 선택된 일정을 불러온다.
    /// - Parameter date: 선택된 일자
    func loadSchedule(_ date: Date) {
        
    }
}
