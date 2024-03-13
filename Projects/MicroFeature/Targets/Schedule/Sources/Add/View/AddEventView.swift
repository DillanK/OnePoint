//
//  AddView.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/12/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import BaseFramework
import CommonFramework
import AssetFramework
import LocalizeStringFramework
import SnapKit

class AddEventView: BaseView {
    static func create() -> BaseView {
        return AddEventView(isBindCall: false).apply {
            $0.initializeCall()
        }
    }
    
    private lazy var vTempraryBoxGroup = {
        UIView().apply {
            $0.backgroundColor = BBColor.black17.color()
        }
    }()
    
    private lazy var btnTempraryBox = {
        UIButton(type: .system).apply {
            $0.setTitle("임시박스로 이동", for: .normal)
            $0.backgroundColor = BBColor.black17.color()
            $0.titleLabel?.font = BBFont.NotoSansKR.medium.font(size: 16)
            $0.tintColor = BBColor.white.color()
        }
    }()
    
    private lazy var vAddScheduleGroup = {
        UIView().apply {
            $0.backgroundColor = BBColor.clearBlue.color()
        }
    }()
    
    private lazy var btnAddSchedule = {
        UIButton(type: .system).apply {
            $0.setTitle("일정추가", for: .normal)
            $0.backgroundColor = BBColor.clearBlue.color()
            $0.titleLabel?.font = BBFont.NotoSansKR.medium.font(size: 16)
            $0.tintColor = BBColor.white.color()
        }
    }()
    
    override func bindView() {
        addSubview(vTempraryBoxGroup)
        vTempraryBoxGroup.addSubview(btnTempraryBox)
        addSubview(vAddScheduleGroup)
        vAddScheduleGroup.addSubview(btnAddSchedule)
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        vTempraryBoxGroup.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
            $0.right.equalTo(vAddScheduleGroup.snp.left)
            $0.width.equalTo(vAddScheduleGroup.snp.width)
            $0.height.equalTo(54 + safeArea().bottom / 2)
        }
        
        vAddScheduleGroup.snp.makeConstraints {
            $0.top.bottom.right.equalToSuperview()
            $0.left.equalTo(vTempraryBoxGroup.snp.right)
            $0.width.equalTo(vTempraryBoxGroup.snp.width)
            $0.height.equalTo(54 + safeArea().bottom / 2)
        }
        
        btnTempraryBox.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(-safeArea().bottom / 2)
        }
        
        btnAddSchedule.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(-safeArea().bottom / 2)
        }
    }
}
