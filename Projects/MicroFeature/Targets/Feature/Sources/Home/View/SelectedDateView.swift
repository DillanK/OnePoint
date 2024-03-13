//
//  SelectedDateView.swift
//  FeatureFramework
//
//  Created by Jin Salon on 3/4/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import SnapKit
import UIKit
import BaseFramework
import AssetFramework

class SelectedDateView: BaseView {
    public static func create(viewModel: SelectedDateViewModel) -> BaseView {
        return SelectedDateView(isBindCall: false).apply {
            $0.backgroundColor = .clear
            $0.viewModel = viewModel
            $0.initializeCall()
        }
    }
    
    private lazy var lblTodayBadge = {
        UILabel().apply {
            $0.font = BBFont.NotoSansKR.bold.font(size: 11)
            $0.layer.borderColor = BBColor.todayBorder.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 6
            $0.backgroundColor = BBColor.todayBackground.color()
            $0.textColor = BBColor.todayText.color()
            $0.text = "TODAY"
            $0.textAlignment = .center
        }
    }()
    
    private lazy var vDateGroup = {
        UIView()
    }()
    
    private lazy var btnSelectedDate = {
        UIButton(type: .system).apply {
            $0.setTitle("2023.11.22", for: .normal)
            $0.setTitleColor(BBColor.selectedDate.color(), for: .normal)
            $0.titleLabel?.font = BBFont.NotoSansKR.bold.font(size: 44)
        }
    }()
    
    private lazy var lblWeekday = {
        UILabel().apply {
            $0.text = "수"
            $0.font = BBFont.NotoSansKR.medium.font(size: 18)
            $0.textColor = BBColor.selectedScheduleWeekday.color()
        }
    }()
    
    private lazy var btnPrevDay = {
        UIButton(type: .system).apply {
            $0.setImage(BBImage.btnDayBefore.image(), for: .normal)
            $0.tintColor = BBColor.selectedSchedulePrevNext.color()
        }
    }()
    
    private lazy var btnNextDay = {
        UIButton(type: .system).apply {
            $0.setImage(BBImage.btnDayNext.image(), for: .normal)
            $0.tintColor = BBColor.selectedSchedulePrevNext.color()
        }
    }()
    
    private lazy var vStateCountGroup = {
        UIView()
    }()
    
    private lazy var btnCompleteCount = {
        UIButton(type: .system).apply {
            $0.setTitle("완료건수 3", for: .normal)
            $0.titleLabel?.textAlignment = .center
        }
    }()
    
    private lazy var ivVerticalLine = {
        UIImageView().apply {
            $0.backgroundColor = BBColor.selectedScheduleLine.color()
        }
    }()
    
    private lazy var btnScheduleCount = {
        UIButton(type: .system).apply {
            $0.setTitle("일정건수 7", for: .normal)
            $0.titleLabel?.textAlignment = .center
        }
    }()
    
    var viewModel: SelectedDateViewModel!
    
    /// Init Call Step1(View addSubview 등 처리)
    override func bindView() {
        addSubview(lblTodayBadge)
        addSubview(btnPrevDay)
        addSubview(btnNextDay)
        addSubview(vDateGroup)
        vDateGroup.addSubview(btnSelectedDate)
        vDateGroup.addSubview(lblWeekday)
        addSubview(vStateCountGroup)
        vStateCountGroup.addSubview(btnCompleteCount)
        vStateCountGroup.addSubview(ivVerticalLine)
        vStateCountGroup.addSubview(btnScheduleCount)
    }
    
    /// Init Call Step2(delegate, action 설정 처리)
    override func bindEvent() {
//        btnAddSchedule.addTarget(self, action: #selector(eventAddSchdule(_:)), for: .touchUpInside)
//        btnAddSchedule.addTarget(self, action: #selector(eventSetting(_:)), for: .touchUpInside)
    }
    
    /// Init Call Step3(Combine, Delegate 제약사항 추가)
    override func bindCombine() { }
    
    /// Init Call Step4(View의 위치 및 제약사항 추가)
    override func bindConstraint(_ isAdjustWindow: Bool) {
        lblTodayBadge.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16.5)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(50)
            $0.height.equalTo(21)
        }
        
        vDateGroup.snp.makeConstraints {
            $0.top.equalTo(lblTodayBadge.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        btnSelectedDate.snp.makeConstraints {
            $0.top.left.bottom.equalToSuperview()
            $0.width.equalTo(231)
        }
        
        lblWeekday.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(btnSelectedDate.snp.right).offset(8)
            $0.right.equalToSuperview()
            $0.width.equalTo(18)
            $0.height.equalTo(44)
        }
        
        btnPrevDay.snp.makeConstraints {
            $0.top.equalTo(vDateGroup.snp.top)
            $0.bottom.equalTo(vDateGroup.snp.bottom)
            $0.right.equalTo(vDateGroup.snp.left).offset(-22)
        }
        
        btnNextDay.snp.makeConstraints {
            $0.top.equalTo(vDateGroup.snp.top)
            $0.bottom.equalTo(vDateGroup.snp.bottom)
            $0.left.equalTo(vDateGroup.snp.right).offset(22)
        }
        
        vStateCountGroup.snp.makeConstraints {
            $0.top.equalTo(vDateGroup.snp.bottom).offset(17)
            $0.bottom.equalToSuperview().offset(-17)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(20)
        }

        btnCompleteCount.snp.makeConstraints {
            $0.top.left.bottom.equalToSuperview()
        }
        
        ivVerticalLine.snp.makeConstraints {
            $0.top.equalToSuperview().offset(2)
            $0.left.equalTo(btnCompleteCount.snp.right).offset(5)
            $0.width.equalTo(1)
            $0.bottom.equalToSuperview().offset(-2)
        }
        
        btnScheduleCount.snp.makeConstraints {
            $0.top.bottom.right.equalToSuperview()
            $0.left.equalTo(ivVerticalLine.snp.right).offset(8)
        }
    }
}
