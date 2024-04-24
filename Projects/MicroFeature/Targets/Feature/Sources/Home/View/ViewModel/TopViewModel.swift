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
import CoreFramework

public class TopViewModel: BaseViewModel {
    public var input = Input()
    public var output = Output()
    
    public override func bindInputCombine() {
        input.observeRequest
            .throttle(for: 0.2, scheduler: RunLoop.main, latest: true)
            .sink { type in
                switch type {
                case .ADD_SCHEDULE:
                    self.output.observeResponse.send(.ADD_SCHEDULE)
                case .SETTING:
                    self.output.observeResponse.send(.SETTING)
                case .SEARCH:
                    self.output.observeResponse.send(.SEARCH)
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
        let observeRequest = PassthroughSubject<Request, Never>()
    }
    
    public struct Output {
        let observeResponse = PassthroughSubject<Response, Never>()
    }
}
