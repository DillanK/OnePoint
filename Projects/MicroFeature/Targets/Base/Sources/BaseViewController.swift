//
//  BaseViewController.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/10/26.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        bindView()
        bindEvent()
        bindCombine()
        self.view.setNeedsUpdateConstraints()
        
        // iPad 인경우 사이즈 변경에 대한 이벤트를 받음
        if isPad() {
            windowScene()?.delegate = self
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func updateViewConstraints() {
        self.bindConstraint()
        super.updateViewConstraints()
    }
    
    /// Init Call Step1(View addSubview 등 처리)
    open func bindView() { }
    
    /// Init Call Step2(delegate, action 설정 처리)
    open func bindEvent() { }
    
    /// Init Call Step3(Combine, Delegate 제약사항 추가)
    open func bindCombine() { }
    
    /// Init Call Step4(View의 위치 및 제약사항 추가)
    open func bindConstraint() { }
}

extension BaseViewController: UIWindowSceneDelegate {
    public func windowScene(_ windowScene: UIWindowScene, didUpdate previousCoordinateSpace: UICoordinateSpace, interfaceOrientation previousInterfaceOrientation: UIInterfaceOrientation, traitCollection previousTraitCollection: UITraitCollection) {
        self.view.subviews.forEach { view in
            if let baseView = view as? BaseView, baseView.isNeedAdjustWindowEvent {
                baseView.isAdjustWindow = true
                baseView.setNeedsUpdateConstraints()
            }
        }
    }
}
