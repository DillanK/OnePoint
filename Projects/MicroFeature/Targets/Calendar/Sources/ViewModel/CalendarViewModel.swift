//
//  CalendarViewModel.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/28.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import Foundation
import Combine
import BaseFramework

class CalendarViewModel: BaseViewModel {
    var input = Input()
    var output = Output()
    
    override func bindInputCombine() {
        input.calendar
            .throttle(for: 0.2, scheduler: RunLoop.main, latest: true)
            .sink { type in
                switch type {
                case .makeMonthlyData(let isGabageData):
                    self.loadMonthlyData()
//                case .makeDays(let isBefore, let days, let model):
//                    self.makeDailyData(isBefore, days, referenceData: model)
//                case .makeWeekend(let referenceData, let overData):
//                    debugPrint(#file, #function, #line, "ReferenceData : \(referenceData.description)")
//                    self.makeWeekendData(model: referenceData, overData: overData)
            }
        }.store(in: &cancellable)
    }
}

extension CalendarViewModel: BaseViewModelProtocol {
    enum RequestCalendar {
        case makeMonthlyData(isGabageData: Bool = true)
        /// 한 주간 데이터 생성
        /// - Parameter referenceData : 데이터를 생성할 기준 데이터
//        case makeWeekend(referenceData: DailyModel, overData: Int = 0)
        /// 일간 데이터 생성
        /// - Parameter isBefore : 이전 데이터 생성 시 true, 이후는 false
//        case makeDays(isBefore: Bool, fewDays: Int, referenceData: DailyModel?)
    }
    
    enum ResponseCalendar {
        case completeMakeMonthly(Array<(String, CalendarModelProtocol)>)
    }
    
//    enum ResponseMonth {
//        case completeMakeMonthly(Array<(String, DailyModel)>)
//    }
    
//    enum ResponseWeekend {
//        case completeWeekend(Array<(String, DailyModel)>, referenceDate: String)
//    }
//    
//    enum ResponseDay {
//        case completeMakeDays(Array<(String, DailyModel)>)
//    }
    
    enum ResponseError {
        case failMakeDays(Bool, Int, DailyModel?)
        case failMakeWeekend(DailyModel)
    }
    
    struct Input {
        let calendar = PassthroughSubject<RequestCalendar, Never>()
    }
    
    struct Output {
        let calendar = PassthroughSubject<ResponseCalendar, Never>()
        
//        let month = PassthroughSubject<ResponseMonth, Never>()
//        let week = PassthroughSubject<ResponseWeekend, Never>()
//        let day = PassthroughSubject<ResponseDay, Never>()
        let error = PassthroughSubject<ResponseError, Never>()
    }
}

extension CalendarViewModel {
    func loadMonthlyData() {
        // 저장된 데이터가 있다면 저장된 데이터 사용
        makeMonthlyData(true) { result in
            debugPrint(result)
            self.output.calendar.send(.completeMakeMonthly(result))
        }
    }
    
//    func makeWeekendData(model: DailyModel, overData: Int) {
//        self.makeDataToDays(true, (overData * 7), referenceData: model) { result in
//            debugPrint(#file, #function, #line, result)
//            var resultDatas = Array<(String, DailyModel)>()
//            guard let validResult = result else {
//                self.output.error.send(.failMakeWeekend(model))
//                return
//            }
//            resultDatas.append(contentsOf: validResult)
////            self.output.calendar.send(.completeWeekend(validResult, referenceDate: model.convertDailyString()))
//
//            self.makeDataToDays(false, ((overData + 1) * 7), referenceData: model) { result in
//                resultDatas.append(contentsOf: result!.dropFirst().dropLast())
//                debugPrint(#file, #function, #line, resultDatas)
//                guard let validResult = result else {
//                    self.output.error.send(.failMakeWeekend(model))
//                    return
//                }
////                self.output.week.send(.completeWeekend(resultDatas, referenceDate: model.convertDailyString()))
//            }
//        }
//    }
//    
//    func makeDailyData(_ isBefore: Bool, _ makeToDays: Int, referenceData model: DailyModel?) {
//        makeDataToDays(isBefore, makeToDays, referenceData: model) { result in
//            debugPrint(#file, #function, #line, result)
//            guard let validResult = result else {
//                self.output.error.send(.failMakeDays(isBefore, makeToDays, model))
//                return
//            }
////            self.output.day.send(.completeMakeDays(validResult))
//        }
//    }
}

extension CalendarViewModel {
    /// 데이터 생성
    private func makeMonthlyData(_ isGabageData: Bool, complete: @escaping (Array<(String, CalendarModelProtocol)>) -> ()) {
        // 시작 년월일 202001 ~ 현재 년도 + 10년
        var datas = Array<(String, CalendarModelProtocol)>()

        let endYear = Calendar(identifier: .gregorian).component(.year, from: Date.now) + 10
        var weekday = convertWeekday(year: 2020, month: 1, day: 1)
        for year in 2020 ... endYear {
            for month in 1 ... 12 {
                datas.append((String(format: "%04d%02d", year, month), MonthlyModel.init(year: year, month: month)))
                
                let lastDay = Month(rawValue: month)!.lastDay(year)
                for day in 1 ... lastDay {
                    if (year == 2020 && month == 1).not(), day == 1 {
                        for _ in 1 ..< weekday {
                            datas.append(((""), DailyEmptyModel()))
                        }
                    } else if isGabageData, (year == 2020 && month == 1), day == 1 {
                        datas.append(("19991229", DailyModel.init(year: 1999, month: 12, day: 29, weekend: Weekend.SUN.value())))
                        datas.append(("19991230", DailyModel.init(year: 1999, month: 12, day: 30, weekend: Weekend.MON.value())))
                        datas.append(("19991231", DailyModel.init(year: 1999, month: 12, day: 31, weekend: Weekend.TUE.value())))
                    }
                    
                    datas.append((String(format: "%04d%02d%02d", year, month, day), DailyModel.init(year: year, month: month, day: day, weekend: weekday)))
                    
                    weekday = weekday + 1 > 7 ? 1 : weekday + 1
                    
                    if day == lastDay, weekday != 1 {
                        debugPrint(#file, #function, #line, "Make Month : \(year)년 \(month)월 \(weekday)")
                        for _ in weekday ... 7 {
                            datas.append(((""), DailyEmptyModel()))
                        }
                    }
                }
            }
        }
        
        complete(datas)
    }
    
    
    /// makeToDays 값만큼 일자를 만들어서 반환한다.
    /// - Parameters:
    ///   - isBefore: 기준 데이터에서 이전 데이터를 만들려면 true, 이후 데이타는 false
    ///   - makeToDays: 만들려고 하는 일 수
    ///   - referenceData: 기준 데이터
    ///   - complete: 데이터를 생성하면 반환한다.
    private func makeDataToDays(_ isBefore: Bool, _ makeToDays: Int, referenceData model: DailyModel? = nil, complete: @escaping (Array<(String, DailyModel)>?) -> ()) {
        // ReferenceData는 제외한 값을 반환한다.
        guard let referceDate = model == nil ? Date.now : model!.convertDate(),
              let calculationDate = Date.calculationDay(isBefore: isBefore, referenceDate: referceDate, day: makeToDays) else {
            complete(nil)
            return
        }

        let startYear = Calendar(identifier: .gregorian).component(.year, from: isBefore ? calculationDate : referceDate)
        let endYear = Calendar(identifier: .gregorian).component(.year, from: isBefore ? referceDate : calculationDate)
        let startMonth = Calendar(identifier: .gregorian).component(.month, from: isBefore ? calculationDate : referceDate)
        let endMonth = Calendar(identifier: .gregorian).component(.month, from: isBefore ? referceDate : calculationDate)
        let startDay = Calendar(identifier: .gregorian).component(.day, from: isBefore ? calculationDate : referceDate)
        let endDay = Calendar(identifier: .gregorian).component(.day, from: isBefore ? referceDate : calculationDate)
        var weekend = Calendar(identifier: .gregorian).component(.weekday, from: referceDate)
        
        var datas = Array<(String, DailyModel)>()
        for year in startYear ... endYear {
            for month in (year == startYear ? startMonth : 1) ... (year < endYear ? 12 : endMonth) {
                for day in (month == startMonth ? startDay : 1) ... (month == endMonth ? endDay : Month(rawValue: month)!.lastDay(year)) {
                    datas.append((String(format: "%04d%02d%02d", year, month, day), .init(year: year, month: month, day: day, weekend: weekend)))
                    weekend = weekend + 1 > 7 ? 1 : weekend + 1
                }
            }
        }
        complete(datas)
    }
    
    private func convertWeekday(year: Int, month: Int, day: Int) -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let convertDate = formatter.date(from:"\(String(format: "%04d%02d%02d", year, month, day))")
        let calendar = Calendar(identifier: .gregorian)
        return calendar.component(.weekday, from: convertDate!)
    }

}
