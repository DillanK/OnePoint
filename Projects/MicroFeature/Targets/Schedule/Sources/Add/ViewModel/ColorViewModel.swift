//
//  ColorViewModel.swift
//  BaseFramework
//
//  Created by Jin Salon on 3/12/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import Combine
import AssetFramework
import BaseFramework

class ColorViewModel: BaseViewModel {
    var input = Input()
    var output = Output()
    
    override func bindInputCombine() {

    }
}

extension ColorViewModel: BaseViewModelProtocol {
    enum Request {

    }
    
    enum Response {
        case SELECTED_COLOR(UIColor)
    }
    
    struct Input {
        
    }
    
    struct Output {
        let res = PassthroughSubject<Response, Never>()
    }
}
