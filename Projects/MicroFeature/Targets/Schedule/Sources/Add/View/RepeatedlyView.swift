//
//  ShareView.swift
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

class RepeatedlyView: BaseView {
    static func create(vm: RepeatedlyViewModel) -> BaseView {
        return RepeatedlyView(isBindCall: false).apply {
            $0.backgroundColor = BBColor.white.color()
            $0.vm = vm
            $0.initializeCall()
        }
    }
    
    private var vm: RepeatedlyViewModel!
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
    
    private lazy var lblRepeatedly = {
        UILabel().apply {
            $0.text = BBString.repeatedly
            $0.textColor = BBColor.brownGrey.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
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
    
    private lazy var btnOnce = {
        UIButton(type: .system).apply {
            $0.contentHorizontalAlignment = .left
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.setTitle(BBString.once, for: .normal)
            $0.contentHorizontalAlignment = .center
            $0.titleLabel?.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.tintColor = BBColor.black51.color()
        }
    }()

    private lazy var btnEveryMonth = {
        UIButton(type: .system).apply {
            $0.contentHorizontalAlignment = .left
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.setTitle(BBString.everyMonth, for: .normal)
            $0.contentHorizontalAlignment = .center
            $0.titleLabel?.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.tintColor = BBColor.black51.color()
        }
    }()
    
    private lazy var btnEveryDay = {
        UIButton(type: .system).apply {
            $0.contentHorizontalAlignment = .left
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.setTitle(BBString.everyDay, for: .normal)
            $0.contentHorizontalAlignment = .center
            $0.titleLabel?.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.tintColor = BBColor.black51.color()
        }
    }()
    
    private lazy var btnEveryWeek = {
        UIButton(type: .system).apply {
            $0.contentHorizontalAlignment = .left
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.setTitle(BBString.everyWeek, for: .normal)
            $0.contentHorizontalAlignment = .center
            $0.titleLabel?.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.tintColor = BBColor.black51.color()
        }
    }()
    
    private lazy var btnEveryYear = {
        UIButton(type: .system).apply {
            $0.contentHorizontalAlignment = .left
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.setTitle(BBString.everyYear, for: .normal)
            $0.contentHorizontalAlignment = .center
            $0.titleLabel?.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.tintColor = BBColor.black51.color()
        }
    }()
    
    override func bindView() {
        addSubview(lblRepeatedly)
        addSubview(btnNo)
        addSubview(btnOnce)
        addSubview(btnEveryMonth)
        addSubview(btnEveryDay)
        addSubview(btnEveryWeek)
        addSubview(btnEveryYear)
    }
    
    override func bindEvent() {
        btnNo.addTarget(self, action: #selector(eventRepeatedly(_:)), for: .touchUpInside)
        btnOnce.addTarget(self, action: #selector(eventRepeatedly(_:)), for: .touchUpInside)
        btnEveryMonth.addTarget(self, action: #selector(eventRepeatedly(_:)), for: .touchUpInside)
        btnEveryDay.addTarget(self, action: #selector(eventRepeatedly(_:)), for: .touchUpInside)
        btnEveryWeek.addTarget(self, action: #selector(eventRepeatedly(_:)), for: .touchUpInside)
        btnEveryYear.addTarget(self, action: #selector(eventRepeatedly(_:)), for: .touchUpInside)
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
        lblRepeatedly.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
            $0.height.equalTo(18)
        }
        
        btnNo.snp.makeConstraints {
            $0.top.equalTo(lblRepeatedly.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(22)
            $0.right.equalTo(btnOnce.snp.left).offset(-6)
            $0.height.equalTo(42)
            $0.width.equalTo(btnOnce.snp.width)
        }
        
        btnOnce.snp.makeConstraints {
            $0.top.equalTo(lblRepeatedly.snp.bottom).offset(4)
            $0.left.equalTo(btnNo.snp.right).offset(6)
            $0.right.equalTo(btnEveryMonth.snp.left).offset(-6)
            $0.height.equalTo(42)
            $0.width.equalTo(btnEveryMonth.snp.width)
        }
        
        btnEveryMonth.snp.makeConstraints {
            $0.top.equalTo(lblRepeatedly.snp.bottom).offset(4)
            $0.left.equalTo(btnOnce.snp.right).offset(6)
            $0.right.equalToSuperview().offset(-22)
            $0.height.equalTo(42)
            $0.width.equalTo(btnOnce.snp.width)
        }
        
        btnEveryDay.snp.makeConstraints {
            $0.top.equalTo(btnNo.snp.bottom).offset(6)
            $0.left.equalTo(btnNo.snp.left)
            $0.right.equalTo(btnNo.snp.right)
            $0.height.equalTo(42)
            $0.bottom.equalToSuperview()
        }
        
        btnEveryWeek.snp.makeConstraints {
            $0.top.equalTo(btnOnce.snp.bottom).offset(6)
            $0.left.equalTo(btnOnce.snp.left)
            $0.right.equalTo(btnOnce.snp.right)
            $0.height.equalTo(42)
            $0.bottom.equalToSuperview()
        }
        
        btnEveryYear.snp.makeConstraints {
            $0.top.equalTo(btnEveryMonth.snp.bottom).offset(6)
            $0.left.equalTo(btnEveryMonth.snp.left)
            $0.right.equalTo(btnEveryMonth.snp.right)
            $0.height.equalTo(42)
            $0.bottom.equalToSuperview()
        }
    }
}

extension RepeatedlyView {
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

extension RepeatedlyView {
    @objc func eventRepeatedly(_ sender: UIButton) {
        vm.input.req.send(.SELECTED_BUTTON(
            selected: selectedButton ?? UIButton(),
            current: sender)
        )
    }
}


