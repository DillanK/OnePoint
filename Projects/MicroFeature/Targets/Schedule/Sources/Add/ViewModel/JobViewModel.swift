//
//  JobViewModel.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/18/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import Combine
import AssetFramework
import BaseFramework

class JobViewModel: BaseViewModel {
    var input = Input()
    var output = Output()
    
    var jobs = Array<JobModel>()
    
    override func bindInputCombine() {
        input.req.sink {
            switch $0 {
            case .AddJob(let text):
                debugPrint(#file, #function, #line)
                self.addJob(text)
            case .RemoveJob(let key):
                self.removeJob(key)
            }
        }.store(in: &cancellable)
    }
}

extension JobViewModel: BaseViewModelProtocol {
    enum Request {
        /// 색상 선택 시 호출
        case AddJob(String)
        case RemoveJob(String)
    }
    
    enum Response {
        case RELOAD_TABLE
    }
    
    enum ResponseUI {
        case SCROLL_TARGET(UIView)
    }
    
    struct Input {
        let req = PassthroughSubject<Request, Never>()
    }
    
    struct Output {
        let res = PassthroughSubject<Response, Never>()
        let resScroll = PassthroughSubject<ResponseUI, Never>()
    }
}

extension JobViewModel {
    func addJob(_ text: String) {
        jobs.append(.init(timeStamp: Date.timeStamp(), text: text))
        output.res.send(.RELOAD_TABLE)
    }
    
    func removeJob(_ key: String) {
        for i in 0..<jobs.count {
            if jobs[i].timeStamp == key {
                debugPrint(#file, #function, #line, jobs.remove(at: i))
                break
            }
        }
        output.res.send(.RELOAD_TABLE)
    }
}
