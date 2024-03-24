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
    static func create() -> BaseView {
        return TaskView(isBindCall: false).apply {
            $0.backgroundColor = BBColor.white.color()
            $0.initializeCall()
        }
    }
    
    private lazy var lblTaskDate = {
        UILabel().apply {
            $0.text = BBString.date
            $0.textColor = BBColor.brownGrey.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
        }
    }()
    
    private lazy var btnTaskDate = {
        UIButton(type: .system).apply {
            $0.contentHorizontalAlignment = .left
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
        }
    }()
    
    private lazy var lblTaskDateValue = {
        UILabel().apply {
            $0.text = "2023-11-22"
            $0.textColor = BBColor.black51.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 13)
        }
    }()
    
    private lazy var ivTaskDate = {
        UIImageView(image: BBImage.btnInputCalendar.image())
    }()
    
    private lazy var lblTaskStartEnd = {
        UILabel().apply {
            $0.text = BBString.startEndTime
            $0.textColor = BBColor.brownGrey.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
        }
    }()
    
    private lazy var btnTaskStartEnd = {
        UIButton(type: .system).apply {
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
        }
    }()
    private lazy var lblTaskStartEndValue = {
        UILabel().apply {
            $0.text = "10:30 ~ 14:00"
            $0.textColor = BBColor.black51.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 13)
        }
    }()
    
    private lazy var ivTaskStartEnd = {
        UIImageView(image: BBImage.btnInputTime.image())
    }()
    
    override func bindView() {
        addSubview(lblTaskDate)
        addSubview(btnTaskDate)
        btnTaskDate.addSubview(lblTaskDateValue)
        btnTaskDate.addSubview(ivTaskDate)
        addSubview(lblTaskStartEnd)
        addSubview(btnTaskStartEnd)
        btnTaskStartEnd.addSubview(lblTaskStartEndValue)
        btnTaskStartEnd.addSubview(ivTaskStartEnd)
    }
    
    override func bindEvent() {
        btnTaskDate.addTarget(self, action: #selector(eventTaskStart(_:)), for: .touchUpInside)
        btnTaskStartEnd.addTarget(self, action: #selector(eventTaskEnd(_:)), for: .touchUpInside)
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        lblTaskDate.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalTo(lblTaskStartEnd.snp.left).offset(-7)
            $0.height.equalTo(18)
            $0.width.equalTo(lblTaskStartEnd.snp.width)
        }
        
        btnTaskDate.snp.makeConstraints {
            $0.top.equalTo(lblTaskDate.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(22)
            $0.right.equalTo(btnTaskStartEnd.snp.left).offset(-7)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(42)
            $0.width.equalTo(btnTaskStartEnd.snp.width)
        }
        
        lblTaskDateValue.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalTo(ivTaskDate.snp.left).offset(-10)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        ivTaskDate.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(26)
        }
        
        lblTaskStartEnd.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.left.equalTo(lblTaskDate.snp.right).offset(7)
            $0.right.equalToSuperview().offset(-26)
            $0.height.equalTo(18)
            $0.width.equalTo(lblTaskDate.snp.width)
        }
        
        btnTaskStartEnd.snp.makeConstraints {
            $0.top.equalTo(lblTaskStartEnd.snp.bottom).offset(4)
            $0.left.equalTo(btnTaskDate.snp.right).offset(7)
            $0.right.equalToSuperview().offset(-22)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(42)
            $0.width.equalTo(btnTaskStartEnd.snp.width)
        }
        
        lblTaskStartEndValue.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalTo(ivTaskStartEnd.snp.left).offset(-10)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        ivTaskStartEnd.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(26)
        }
    }
}

extension TaskView {
    @objc func eventTaskStart(_ sender: UIButton) {
        
    }
    
    @objc func eventTaskEnd(_ sender: UIButton) {
        
    }
}

