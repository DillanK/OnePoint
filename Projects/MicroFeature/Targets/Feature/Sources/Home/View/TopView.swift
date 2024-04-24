//
//  TopView.swift
//  FeatureFramework
//
//  Created by Jin Salon on 3/1/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import SnapKit
import UIKit
import BaseFramework
import AssetFramework

class TopView: BaseView {
    public static func create(viewModel: TopViewModel) -> BaseView {
        return TopView(isBindCall: false).apply {
            $0.backgroundColor = .clear
            $0.viewModel = viewModel
            $0.initializeCall()
        }
    }
    
    private lazy var btnCalendar = {
        UIButton(type: .system).apply {
            $0.setImage(BBImage.btnMenuMonth.image(), for: .normal)
            $0.tintColor = BBColor.buttonBlack.color()
        }
    }()
    
    private lazy var btnSetting = {
        UIButton(type: .system).apply {
            $0.setImage(BBImage.btnSetup.image(), for: .normal)
            $0.tintColor = BBColor.buttonBlack.color()
        }
    }()
    
    private lazy var btnSearch = {
        UIButton(type: .system).apply {
            $0.setImage(BBImage.btnHeaderSearch.image(), for: .normal)
            $0.tintColor = BBColor.buttonBlack.color()
        }
    }()
    
    var viewModel: TopViewModel!
    
    /// Init Call Step1(View addSubview 등 처리)
    override func bindView() {
        addSubview(btnCalendar)
        addSubview(btnSetting)
        addSubview(btnSearch)
    }
    
    /// Init Call Step2(delegate, action 설정 처리)
    override func bindEvent() { 
        btnCalendar.addTarget(self, action: #selector(eventAddSchedule(_:)), for: .touchUpInside)
        btnSetting.addTarget(self, action: #selector(eventSetting(_:)), for: .touchUpInside)
        btnSearch.addTarget(self, action: #selector(eventSearch(_:)), for: .touchUpInside)
    }
    
    /// Init Call Step3(Combine, Delegate 제약사항 추가)
    override func bindCombine() {
//        viewModel.output.observeResponseUI.sink { type in
//            switch type {
//            case .TODAY(let today, let week):
//                self.btnCalendar.setTitle(today, for: .normal)
//            }
//        }.store(in: &cancellable)
    }
    
    /// Init Call Step4(View의 위치 및 제약사항 추가)
    override func bindConstraint(_ isAdjustWindow: Bool) {
        if isAdjustWindow {
            return
        }
        
        btnCalendar.snp.makeConstraints {
            $0.right.equalTo(self.snp.right).offset(-12)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(46)
        }
        
        btnSearch.snp.makeConstraints {
            $0.right.equalTo(self.btnCalendar.snp.left).offset(-4)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(46)
        }
        
        btnSetting.snp.makeConstraints {
            $0.left.equalToSuperview().offset(12)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(46)
        }
    }
}

extension TopView {
    @objc func eventAddSchedule(_ sender: UIButton) {
        debugPrint(#file, #function, #line)
        viewModel.input.observeRequest.send(.ADD_SCHEDULE)
    }
    
    @objc func eventSetting(_ sender: UIButton) {
        debugPrint(#file, #function, #line)
        viewModel.input.observeRequest.send(.SETTING)
    }
    
    @objc func eventSearch(_ sender: UIButton) {
        debugPrint(#file, #function, #line)
        viewModel.input.observeRequest.send(.SEARCH)
    }
}
