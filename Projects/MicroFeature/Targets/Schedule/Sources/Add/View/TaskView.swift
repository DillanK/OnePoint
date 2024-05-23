//
//  TimestampView.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/8/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import BaseFramework
import AssetFramework
import CommonFramework
import LocalizeStringFramework

class TaskView: BaseView {
    static func create(vm: TaskViewModel) -> BaseView {
        return TaskView(isBindCall: false).apply {
            $0.backgroundColor = BBColor.white.color()
            $0.vm = vm
            $0.initializeCall()
        }
    }
    
    private var vm: TaskViewModel!
    
    private lazy var lblTaskStart = {
        UILabel().apply {
            $0.text = "시작일"
            $0.textColor = BBColor.brownGrey.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
        }
    }()
    
    private lazy var vStartGroup = {
        UIView().apply {
            $0.backgroundColor = BBColor.white.color()
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 4
            $0.layer.borderColor = BBColor.paleGrey239.color().cgColor
            $0.layer.borderWidth = 1
        }
    }()
    
    private lazy var lblStartDate = {
        UILabel().apply {
            $0.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.textColor = BBColor.black51.color()
            $0.text = "2023-11-22"
        }
    }()
    
    private lazy var ivStartDateIcon = {
        UIImageView().apply {
            $0.image = BBImage.btnInputCalendar.image()
        }
    }()
    
    private lazy var lblStartTime = {
        UILabel().apply {
            $0.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.textColor = BBColor.black51.color()
            $0.text = "오전 11:12"
        }
    }()
    
    private lazy var ivStartTimeIcon = {
        UIImageView().apply {
            $0.image = BBImage.btnInputTime.image()
        }
    }()
    
    private lazy var btnStart = {
        UIButton(type: .system)
    }()
    
    private lazy var lblConnect = {
        UILabel().apply {
            $0.font = BBFont.NotoSansKR.medium.font(size: 13)
            $0.textColor = BBColor.black51.color()
            $0.text = "~"
        }
    }()
    
    private lazy var lblTaskEnd = {
        UILabel().apply {
            $0.text = "종료일"
            $0.textColor = BBColor.brownGrey.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
        }
    }()
    
    private lazy var vEndGroup = {
        UIView().apply {
            $0.backgroundColor = BBColor.white.color()
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 4
            $0.layer.borderColor = BBColor.paleGrey239.color().cgColor
            $0.layer.borderWidth = 1
        }
    }()
    
    private lazy var lblEndDate = {
        UILabel().apply {
            $0.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.textColor = BBColor.black51.color()
            $0.text = "2023-11-22"
        }
    }()
    
    private lazy var ivEndDateIcon = {
        UIImageView().apply {
            $0.image = BBImage.btnInputCalendar.image()
        }
    }()
    
    private lazy var lblEndTime = {
        UILabel().apply {
            $0.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.textColor = BBColor.black51.color()
            $0.text = "오후 12:12"
        }
    }()
    
    private lazy var ivEndTimeIcon = {
        UIImageView().apply {
            $0.image = BBImage.btnInputTime.image()
        }
    }()
    
    private lazy var btnEnd = {
        UIButton(type: .system)
    }()
    
    override func bindView() {
        addSubview(lblTaskStart)
        addSubview(vStartGroup)
        vStartGroup.addSubview(lblStartDate)
        vStartGroup.addSubview(ivStartDateIcon)
        vStartGroup.addSubview(lblStartTime)
        vStartGroup.addSubview(ivStartTimeIcon)
        vStartGroup.addSubview(btnStart)
        
        addSubview(lblConnect)
        
        addSubview(lblTaskEnd)
        addSubview(vEndGroup)
        vEndGroup.addSubview(lblEndDate)
        vEndGroup.addSubview(ivEndDateIcon)
        vEndGroup.addSubview(lblEndTime)
        vEndGroup.addSubview(ivEndTimeIcon)
        vEndGroup.addSubview(btnEnd)
    }
    
    override func bindEvent() {
        btnStart.addTarget(self, action: #selector(eventTaskStart(_:)), for: .touchUpInside)
        btnEnd.addTarget(self, action: #selector(eventTaskEnd(_:)), for: .touchUpInside)
    }
    
    override func bindCombine() {
        vm.output.res.sink {
            switch $0 {
            case .CHANGE_TASK_START(let model):
                debugPrint(#file, #function, #line)
                self.changeDateTime(
                    targetDate: self.lblStartDate, targetTime: self.lblStartTime, model: model
                )
            case .CHANGE_TASK_END(let model):
                debugPrint(#file, #function, #line)
                self.changeDateTime(
                    targetDate: self.lblEndDate, targetTime: self.lblEndTime, model: model
                )
            }
        }.store(in: &cancellable)
    }
    
    override func initData() {

    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        lblTaskStart.snp.makeConstraints {
            $0.left.equalTo(vStartGroup.snp.left).offset(4)
            $0.top.equalToSuperview().offset(32)
            $0.bottom.equalTo(vStartGroup.snp.top).offset(-4)
            $0.height.equalTo(18)
        }
        
        vStartGroup.snp.makeConstraints {
            $0.left.equalToSuperview().offset(22)
            $0.bottom.equalToSuperview().offset(-16)
            $0.right.equalTo(lblConnect.snp.left).offset(-9)
            $0.height.equalTo(83)
            $0.width.equalTo(vEndGroup.snp.width)
        }
        
        ivStartDateIcon.snp.makeConstraints {
            $0.size.equalTo(26)
            $0.top.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
        }
        
        ivStartTimeIcon.snp.makeConstraints {
            $0.size.equalTo(26)
            $0.top.equalTo(ivStartDateIcon.snp.bottom).offset(11)
            $0.right.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        lblStartDate.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(ivStartDateIcon.snp.top)
            $0.bottom.equalTo(ivStartDateIcon.snp.bottom)
        }
        
        lblStartTime.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(ivStartTimeIcon.snp.top)
            $0.bottom.equalTo(ivStartTimeIcon.snp.bottom)
        }
        
        btnStart.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        lblConnect.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-16)
            $0.width.equalTo(8)
            $0.height.equalTo(83)
        }
        
        lblTaskEnd.snp.makeConstraints {
            $0.left.equalTo(vEndGroup.snp.left).offset(4)
            $0.top.equalToSuperview().offset(32)
            $0.bottom.equalTo(vEndGroup.snp.top).offset(-4)
            $0.height.equalTo(18)
        }
        
        vEndGroup.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-22)
            $0.bottom.equalToSuperview().offset(-16)
            $0.left.equalTo(lblConnect.snp.right).offset(9)
            $0.height.equalTo(83)
            $0.width.equalTo(vStartGroup.snp.width)
        }
        
        ivEndDateIcon.snp.makeConstraints {
            $0.size.equalTo(26)
            $0.top.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
        }
        
        ivEndTimeIcon.snp.makeConstraints {
            $0.size.equalTo(26)
            $0.top.equalTo(ivEndDateIcon.snp.bottom).offset(11)
            $0.right.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        lblEndDate.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(ivEndDateIcon.snp.top)
            $0.bottom.equalTo(ivEndDateIcon.snp.bottom)
        }
        
        lblEndTime.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(ivEndTimeIcon.snp.top)
            $0.bottom.equalTo(ivEndTimeIcon.snp.bottom)
        }
        
        btnEnd.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension TaskView {
    func changeDateTime(targetDate: UILabel, targetTime: UILabel, model: DailyModel) {
        targetDate.text = String(format: "%04d-%02d-%02d", model.year, model.month, model.day)
        targetTime.text = String(format: "%02d-%02d", model.hour, model.minute)
    }
    
    func selectedButton(target: UIView) {
        target.backgroundColor = BBColor.deepSkyBlue.color().withAlphaComponent(0.1)
        target.layer.borderColor = BBColor.deepSkyBlue.color().blendMultiply(
            coverColor: BBColor.deepSkyBlue.color()
        ).cgColor
    }
    
    func unSelectedButton(target: UIView) {
        target.backgroundColor = BBColor.white.color()
        target.layer.borderColor = BBColor.paleGrey239.color().cgColor
    }
}

extension TaskView {
    @objc func eventTaskStart(_ sender: UIButton) {
        debugPrint(#file, #function, #line)
        selectedButton(target: vStartGroup)
        unSelectedButton(target: vEndGroup)
        vm.input.req.send(.CHANGE_TASK_START(
            sender.convert(sender.frame, to: self)
        ))
    }
    
    @objc func eventTaskEnd(_ sender: UIButton) {
        debugPrint(#file, #function, #line)
        selectedButton(target: vEndGroup)
        unSelectedButton(target: vStartGroup)
        vm.input.req.send(.CHANGE_TASK_END(
            sender.convert(sender.frame, to: self)
        ))
    }
}

