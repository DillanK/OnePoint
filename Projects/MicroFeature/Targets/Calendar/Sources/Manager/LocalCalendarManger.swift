//
//  CalendarManger.swift
//  FeatureFamework
//
//  Created by hyunjin on 2024/01/04.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import Foundation
import Combine
import CoreFramework

class LocalCalendarManger: NSObject {
    static let shared = LocalCalendarManger()
    
    private var cancellable: Set<AnyCancellable>
    private lazy var viewModel = {
        CalendarViewModel(cancellable)
    }()
    
    /// 2020~2030년도 까지의 월간 데이터 모든 데이터는 요기에.
    var monthlyData = Array<(String, CalendarModelProtocol)>()
    /// 결과 값 밭아서 처리
    var response = PassthroughSubject<LocalCalendar, LocalCalendarError>()
    
    private init(cancellable: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.cancellable = cancellable
        super.init()
        
        // 초기화 함수 호출
        self.bindCombine()
        self.initMakeMonthlyData()
    }
}

private extension LocalCalendarManger {
    func bindCombine() {
        viewModel.output.calendar.sink { type in
            switch type {
            case .completeMakeMonthly(let result):
                debugPrint("Make Monthly Data : \(result)")
                self.monthlyData = result
                // 결과 값 체크 후 반환 처리
                self.responsMonthlyDataAfterConfirmation()
            }
        }.store(in: &cancellable)
    }
    
    /// 2020년도 부터 2030년도까지 데이터 생성
    func initMakeMonthlyData() {
        viewModel.input.calendar.send(.makeMonthlyData(isGabageData: true))
    }
    
    /// 월간 데이터를 체크 후 결과 값을 반환
    func responsMonthlyDataAfterConfirmation() {
        if monthlyData.isEmpty {
            response.send(completion: .failure(.FAIL_LOAD_MONTHLY_DATA))
        } else {
            response.send(.LOAD_MONTHLY_DATA)
        }
    }
}

extension LocalCalendarManger {
    /// 월간 데이터를 생성한다.
    func loadMonthly() {
        guard monthlyData.isEmpty.not() else {
            viewModel.input.calendar.send(.makeMonthlyData())
            return
        }
        
        response.send(.LOAD_MONTHLY_DATA)
    }
    
    func loadWeekendly() {
        guard monthlyData.isEmpty.not() else {
            viewModel.input.calendar.send(.makeMonthlyData(
                isGabageData: true, isEmptyData: false, isMonth: false
            ))
            return
        }
        
        response.send(.LOAD_WEEKENDLY_DATA)
    }
}
