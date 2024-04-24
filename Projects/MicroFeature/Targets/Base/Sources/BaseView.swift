//
//  BaseView.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/10/26.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit
import CoreFramework
import Combine

open class BaseView: UIView {
    public var cancellable = Set<AnyCancellable>()
    private var initCancellable: AnyCancellable?
    private var initThrottleCancellable: AnyCancellable?
    
    /// iPad에서 화면 크기 변경 이벤트를 받아서 처리하는지 여부
    public var isNeedAdjustWindowEvent = true
    /// iPad 화면 크기가 사용자에 의해 변경되면 true
    public var isAdjustWindow = false
    
    private lazy var viewModel = {
        InitViewModel(cancellable)
    }()
    
    public init(isBindCall: Bool = true) {
        super.init(frame: UIScreen.main.bounds)
        debugPrint(#file, #function, #line, "Init")
        
        if isBindCall {
            initializeCall()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        debugPrint(#file, #function, #line, "Init Frame")
        
        initializeCall()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func updateConstraints() {
        
        viewModel.input.requestThrottleGuard.send(.bindConstraint(isAdjustWindow))
        super.updateConstraints()
    }
    
    deinit {
        initCancellable?.cancel()
    }
    
    open func initializeCall() {
        initCancellable?.cancel()
        initCancellable = viewModel.input.request.sink { type in
            switch type {
            case .initData:
                self.initData()
            case .bindView:
                self.bindView()
            case .bindEvent:
                self.bindEvent()
            case .bindCombine:
                self.bindCombine()
            }
        }
        
        initThrottleCancellable?.cancel()
        initThrottleCancellable = viewModel.input.requestThrottleGuard.throttle(for: 0.2, scheduler: RunLoop.main, latest: true).sink { type in
            switch type {
            case .bindConstraint(_):
                self.bindConstraint(self.isAdjustWindow)
                self.isAdjustWindow = false
            }
        }

        viewModel.input.request.send(.bindView)
        viewModel.input.request.send(.bindEvent)
        viewModel.input.request.send(.bindCombine)
        viewModel.input.request.send(.initData)
        
        setNeedsUpdateConstraints()
    }

    open func initData() { }
    /// Init Call Step1(View addSubview 등 처리)
    open func bindView() { }
    
    /// Init Call Step2(delegate, action 설정 처리)
    open func bindEvent() { }
    
    /// Init Call Step3(Combine, Delegate 제약사항 추가)
    open func bindCombine() { }
    
    /// Init Call Step4(View의 위치 및 제약사항 추가)
    open func bindConstraint(_ isAdjustWindow: Bool) { }
}
