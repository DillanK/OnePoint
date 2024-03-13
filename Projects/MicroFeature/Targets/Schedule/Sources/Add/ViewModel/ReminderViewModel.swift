//
//  ReminderViewModel.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/13/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import Combine
import AssetFramework
import BaseFramework

class ReminderViewModel: BaseViewModel {
    var input = Input()
    var output = Output()
    
    override func bindInputCombine() {
        input.req.sink {
            switch $0 {
            case .SELECTED_COLOR(let color):
                debugPrint(#file, #function, #line)
                self.selectedColor(color)
                self.output.res.send(.RELOAD_COLOR)
            case .SELECTED_BUTTON(let selected, let current):
                self.checkRestoreButton(selected, current)
                self.output.res.send(.STORE_BUTTON(current))
            }
        }.store(in: &cancellable)
    }
}

extension ReminderViewModel: BaseViewModelProtocol {
    enum Request {
        /// 색상 선택 시 호출
        case SELECTED_COLOR(UIColor)
        /// 버튼 선택 시 호출
        case SELECTED_BUTTON(selected: UIButton, current: UIButton)
    }
    
    enum Response {
        case STORE_COLOR(line: UIColor, text: UIColor)
        case RESTORE_BUTTON
        case STORE_BUTTON(UIButton)
        case RELOAD_COLOR
    }
    
    struct Input {
        let req = PassthroughSubject<Request, Never>()
    }
    
    struct Output {
        let res = PassthroughSubject<Response, Never>()
    }
}

extension ReminderViewModel {
    private func selectedColor(_ color: UIColor) {
        output.res.send(.STORE_COLOR(
            line: color,
            text: color.blendMultiply(coverColor: color))
        )
    }
    
    private func checkRestoreButton(_ selected: UIButton, _ current: UIButton) {
        if selected != current {
            output.res.send(.RESTORE_BUTTON)
        }
    }
}
