//
//  AddBaseView.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/8/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import BaseFramework
import AssetFramework
import CommonFramework

class TitleView: BaseView {
    static func create(vm: TitleViewModel) -> BaseView {
        return TitleView(isBindCall: false).apply {
            $0.vm = vm
            $0.initializeCall()
            $0.backgroundColor = BBColor.paleGrey245.color()
        }
    }
    
    private var vm: TitleViewModel!
    
    lazy var vSafeArea = {
        UIView().apply {
            $0.backgroundColor = BBColor.paleGrey245.color()
        }
    }()
    
    lazy var btnClose = {
        UIButton(type: .system).apply {
            $0.setImage(BBImage.btnClosePopup.image(), for: .normal)
            $0.tintColor = BBColor.black.color()
        }
    }()
    
    lazy var tfTitle = {
        UITextField().apply {
            $0.placeholder = "일정을 입력해주세요."
            $0.setPlaceholderColor(BBColor.veryLightPink187.color())
            $0.font = BBFont.NotoSansKR.medium.font(size: 22)
            $0.textColor = BBColor.black17.color()
        }
    }()
    
    lazy var vLine = {
        UIView().apply {
            $0.backgroundColor = BBColor.veryLightPink226.color()
        }
    }()
    
    override func bindView() {
//        addSubview(vSafeArea)
        addSubview(btnClose)
        addSubview(tfTitle)
        addSubview(vLine)
    }
    
    override func bindEvent() {
        btnClose.addTarget(self, action: #selector(eventClose(_:)), for: .touchUpInside)
    }
    
    override func bindCombine() {
        vm.output.res.sink {
            switch $0 {
            case .SELECTED_COLOR(let color):
                self.backgroundColor = color
            }
        }.store(in: &cancellable)
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
//        vSafeArea.snp.makeConstraints {
//            $0.top.left.right.equalToSuperview()
//            $0.height.equalTo(safeArea().top)
//        }
        
        btnClose.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12 + safeArea().top)//equalTo(vSafeArea.snp.bottom).offset(12)
            $0.right.equalToSuperview().offset(-12)
            $0.size.equalTo(46)
        }
        
        tfTitle.snp.makeConstraints {
            $0.top.equalTo(btnClose.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(26)
        }
        
        vLine.snp.makeConstraints {
            $0.top.equalTo(tfTitle.snp.bottom).offset(18)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview().offset(-24)
        }
    }
}

extension TitleView {
    @objc func eventClose(_ sender: UIButton) {
        vm.output.resRelay.send(.CLOSE)
    }
}
