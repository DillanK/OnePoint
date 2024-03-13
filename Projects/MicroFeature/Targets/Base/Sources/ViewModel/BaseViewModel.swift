//
//  BaseViewModel.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/03.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import Foundation
import Combine

public protocol BaseViewModelProtocol {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get set }
    var output: Output { get set }
    
    func bindInputCombine()
}

open class BaseViewModel {
    public var cancellable: Set<AnyCancellable>
    
    public init(_ cancellable: Set<AnyCancellable>) {
        self.cancellable = cancellable
        
        bindInputCombine()
    }
    
    open func bindInputCombine() { }
}
