//
//  TopViewModel.swift
//  BaseFramework
//
//  Created by Jin Salon on 3/1/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import Foundation
import BaseFramework
import Combine

public class TopViewModel: BaseViewModel {
    public var input = Input()
    public var output = Output()
    
    public override func bindInputCombine() {
        input.clickEvent
            .throttle(for: 0.2, scheduler: RunLoop.main, latest: true)
            .sink { type in
                switch type {
                case .ADD_SCHEDULE:
                    self.output.clickEvent.send(.ADD_SCHEDULE)
                case .SETTING:
                    self.output.clickEvent.send(.SETTING)
                case .SEARCH:
                    self.output.clickEvent.send(.SEARCH)
                }
            }
            .store(in: &cancellable)
    }
}

extension TopViewModel: BaseViewModelProtocol {
    enum Request {
        case ADD_SCHEDULE
        case SETTING
        case SEARCH
    }
    
    enum Response {
        case ADD_SCHEDULE
        case SETTING
        case SEARCH
    }
    
    public struct Input {
        let clickEvent = PassthroughSubject<Request, Never>()
    }
    
    public struct Output {
        let clickEvent = PassthroughSubject<Response, Never>()
    }
}
