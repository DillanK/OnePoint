//
//  ReminderView.swift
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

class ReminderView: BaseView {
    static func create(vm: ReminderViewModel) -> BaseView {
        return ReminderView(isBindCall: false).apply {
            $0.backgroundColor = BBColor.white.color()
            $0.vm = vm
            $0.initializeCall()
        }
    }
    
    private var vm: ReminderViewModel!
    private var selectedButton: UIButton?
    /// 버튼 복구 색상
    private lazy var restoreColor: UIColor = {
        BBColor.veryLightPink226.color()
    }()
    /// 버튼 복구 텍스트 색상
    private lazy var restoreTextColor: UIColor = {
        BBColor.black51.color()
    }()
    /// 버튼 선택 라인 색상
    private var selectedColor: UIColor?
    /// 버튼 선택 텍스트 색상
    private var selectedTextColor: UIColor?
    
    private lazy var lblReminder = {
        UILabel().apply {
            $0.text = BBString.reminder
            $0.textColor = BBColor.brownGrey.color()
            $0.font = .systemFont(ofSize: 12)
        }
    }()
    
    private lazy var btnNo = {
        UIButton(type: .system).apply {
            $0.contentHorizontalAlignment = .left
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.setTitle(BBString.noReminder, for: .normal)
            $0.contentHorizontalAlignment = .center
            $0.titleLabel?.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.tintColor = BBColor.black51.color()
        }
    }()
    
    private lazy var btnMonthAge = {
        UIButton(type: .system).apply {
            $0.contentHorizontalAlignment = .left
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.setTitle(BBString.aMonthAgo, for: .normal)
            $0.contentHorizontalAlignment = .center
            $0.titleLabel?.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.tintColor = BBColor.black51.color()
        }
    }()
    
    private lazy var btnWeekAge = {
        UIButton(type: .system).apply {
            $0.contentHorizontalAlignment = .left
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.setTitle(BBString.aWeekAgo, for: .normal)
            $0.contentHorizontalAlignment = .center
            $0.titleLabel?.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.tintColor = BBColor.black51.color()
        }
    }()
    
    private lazy var btnDayAgo = {
        UIButton(type: .system).apply {
            $0.contentHorizontalAlignment = .left
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.setTitle(BBString.aDayAgo, for: .normal)
            $0.contentHorizontalAlignment = .center
            $0.titleLabel?.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.tintColor = BBColor.black51.color()
        }
    }()
    
    private lazy var btnDirectTimeSetting = {
        UIButton(type: .system).apply {
            $0.contentHorizontalAlignment = .left
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.setTitle(BBString.directTimeSetting, for: .normal)
            $0.contentHorizontalAlignment = .center
            $0.titleLabel?.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.tintColor = BBColor.black51.color()
        }
    }()
    
    override func bindView() {
        addSubview(lblReminder)
        addSubview(btnNo)
        addSubview(btnMonthAge)
        addSubview(btnWeekAge)
        addSubview(btnDayAgo)
        addSubview(btnDirectTimeSetting)
    }
    
    override func bindEvent() {
        btnNo.addTarget(
            self, action: #selector(eventReminder(_:)), for: .touchUpInside
        )
        btnMonthAge.addTarget(
            self, action: #selector(eventReminder(_:)), for: .touchUpInside
        )
        btnWeekAge.addTarget(
            self, action: #selector(eventReminder(_:)), for: .touchUpInside
        )
        btnDayAgo.addTarget(
            self, action: #selector(eventReminder(_:)), for: .touchUpInside
        )
        btnDirectTimeSetting.addTarget(
            self, action: #selector(eventReminder(_:)), for: .touchUpInside
        )
    }
    
    override func bindCombine() {
        vm.output.res.sink {
            switch $0 {
            case .STORE_COLOR(let lineColor, let textColor):
                debugPrint(#file, #function, #line)
                self.storeColor(lineColor, textColor)
            case .RESTORE_BUTTON:
                debugPrint(#file, #function, #line)
                self.restoredButton()
            case .STORE_BUTTON(let eventButton):
                debugPrint(#file, #function, #line)
                self.storeButton(eventButton)
            case .RELOAD_COLOR:
                self.reloadColor()
            }
        }.store(in: &cancellable)
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        lblReminder.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
            $0.height.equalTo(18)
        }
        
        btnNo.snp.makeConstraints {
            $0.top.equalTo(lblReminder.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(22)
            $0.right.equalTo(btnMonthAge.snp.left).offset(-6)
            $0.height.equalTo(42)
            $0.width.equalTo(btnMonthAge.snp.width)
        }
        
        btnMonthAge.snp.makeConstraints {
            $0.top.equalTo(lblReminder.snp.bottom).offset(4)
            $0.left.equalTo(btnNo.snp.right).offset(6)
            $0.right.equalTo(btnWeekAge.snp.left).offset(-6)
            $0.height.equalTo(42)
            $0.width.equalTo(btnWeekAge.snp.width)
        }
        
        btnWeekAge.snp.makeConstraints {
            $0.top.equalTo(lblReminder.snp.bottom).offset(4)
            $0.left.equalTo(btnMonthAge.snp.right).offset(6)
            $0.right.equalToSuperview().offset(-22)
            $0.height.equalTo(42)
            $0.width.equalTo(btnMonthAge.snp.width)
        }
        
        btnDayAgo.snp.makeConstraints {
            $0.top.equalTo(btnNo.snp.bottom).offset(6)
            $0.left.equalToSuperview().offset(22)
            $0.height.equalTo(42)
            $0.width.equalTo(btnNo.snp.width)
            $0.bottom.equalToSuperview()
        }
        
        btnDirectTimeSetting.snp.makeConstraints {
            $0.top.equalTo(btnWeekAge.snp.bottom).offset(6)
            $0.left.equalTo(btnDayAgo.snp.right).offset(6)
            $0.right.equalToSuperview().offset(-22)
            $0.height.equalTo(42)
            $0.bottom.equalToSuperview()
        }
    }
}

extension ReminderView {
    private func storeColor(_ lineColor: UIColor, _ textColor: UIColor) {
        selectedColor = lineColor
        selectedTextColor = textColor
    }
    
    /// 버튼 원래대로 처리
    private func restoredButton() {
        selectedButton?.layer.borderWidth = 1
        selectedButton?.layer.borderColor = restoreColor.cgColor
        selectedButton?.setTitleColor(restoreTextColor.blendMultiply(
            coverColor: restoreTextColor
        ), for: .normal)
    }
    
    /// 버튼 선택 처리
    private func storeButton(_ eventButton: UIButton) {
        selectedButton = eventButton
        reloadColor()
    }
    
    private func reloadColor() {
        let lineColor = selectedColor ?? restoreColor
        let textColor = selectedTextColor ?? restoreTextColor
        selectedButton?.layer.borderWidth = 2
        selectedButton?.layer.borderColor = lineColor.cgColor
        selectedButton?.setTitleColor(textColor.blendMultiply(
            coverColor: textColor
        ), for: .normal)
    }
}

extension ReminderView {
    @objc func eventReminder(_ sender: UIButton) {
        vm.input.req.send(.SELECTED_BUTTON(
            selected: selectedButton ?? UIButton(),
            current: sender)
        )
    }
}


