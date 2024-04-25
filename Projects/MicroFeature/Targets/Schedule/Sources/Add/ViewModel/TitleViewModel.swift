//
//  TitleViewModel.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/13/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import Combine
import AssetFramework
import BaseFramework

class TitleViewModel: BaseViewModel {
    var input = Input()
    var output = Output()
    
    override func bindInputCombine() {
        input.req.sink {
            switch $0 {
            case .SELECTED_COLOR(let color):
                self.output.res.send(.SELECTED_COLOR(color))
            }
        }.store(in: &cancellable)
    }
}

extension TitleViewModel: BaseViewModelProtocol {
    enum Request {
        /// 색상 선택 시 호출
        case SELECTED_COLOR(UIColor)
    }
    
    enum ResponseRelay {
        case CLOSE
    }
    
    enum Response {
        case SELECTED_COLOR(UIColor)
        case SCROLLING(CGFloat)
    }
    
    struct Input {
        let req = PassthroughSubject<Request, Never>()
    }
    
    struct Output {
        let res = PassthroughSubject<Response, Never>()
        let resRelay = PassthroughSubject<ResponseRelay, Never>()
    }
}
