//
//  ScheduleAddViewContoller.swift
//  BaseFramework
//
//  Created by Jin Salon on 3/8/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import BaseFramework
import AssetFramework
import Combine
import CommonFramework

public class ScheduleAddViewContoller: BaseViewController {
    public static func create(_ currentDate: Date) -> BaseViewController {
        return ScheduleAddViewContoller().apply {
            $0.modalPresentationStyle = .fullScreen
            $0.view.backgroundColor = BBColor.white.color()
            $0.vmTask.output.res.send(.CHANGE_TASK_START(.init(date: currentDate)))
            $0.vmTask.output.res.send(.CHANGE_TASK_END(.init(date: currentDate)))
        }
    }
    
    private var cancellable = Set<AnyCancellable>()
    
    private lazy var vmTitle = {
        TitleViewModel(self.cancellable)
    }()
    
    private lazy var vmTask = {
        TaskViewModel(self.cancellable)
    }()
    
    private lazy var vmReminder = {
        ReminderViewModel(self.cancellable)
    }()
    
    private lazy var vmRepeatedly = {
        RepeatedlyViewModel(self.cancellable)
    }()
    
    private lazy var vmColor = {
        ColorViewModel(self.cancellable)
    }()
    
    private lazy var vmJob = {
        JobViewModel(self.cancellable)
    }()

    private lazy var vTitle = {
        TitleView.create(vm: self.vmTitle)
    }()
    
    private lazy var vTask = {
        TaskView.create(vm: vmTask)
    }()
    
    private lazy var vTaskDateTime = {
        TaskDateTimeView.create(vm: vmTask)
    }()
    
    private lazy var vReminder = {
        ReminderView.create(vm: self.vmReminder)
    }()
    
    private lazy var vRepeatedly = {
        RepeatedlyView.create(vm: self.vmRepeatedly)
    }()
    
    private lazy var vColor = {
        ColorView.create(vm: self.vmColor)
    }()
    
    private lazy var vJob = {
        JobView.create(vm: self.vmJob)
    }()
    
    private lazy var vShare = {
        ShareView.create()
    }()
    
    private lazy var vAddEvent = {
        AddEventView.create()
    }()
    
    private lazy var vScrollGroup = {
        UIScrollView().apply {
            $0.contentInset = .init(top: 0, left: 0, bottom: 100, right: 0)
            $0.bounces = false
        }
    }()
    
    
    
    public override func bindView() {
        view.addSubview(vTitle)
        view.addSubview(vScrollGroup)
        vScrollGroup.addSubview(vTask)
        vScrollGroup.addSubview(vTaskDateTime)
        vScrollGroup.addSubview(vReminder)
        vScrollGroup.addSubview(vRepeatedly)
        vScrollGroup.addSubview(vColor)
        vScrollGroup.addSubview(vJob)
        vScrollGroup.addSubview(vShare)
        view.addSubview(vAddEvent)
        
        vTaskDateTime.isHidden = true
    }
    
    public override func bindEvent() {
        vScrollGroup.delegate = self
    }
    
    public override func bindCombine() {
        vmTitle.output.resRelay.sink {
            switch $0 {
            case .CLOSE:
                self.dismiss(animated: true)
            }
        }.store(in: &cancellable)
        
        vmTask.output.resSelected.sink {
            switch $0 {
            case .SHOW_TASK_DATETIME_START:
                debugPrint(#file, #function, #line)
                self.openDateTimeView(isOpen: true)
            case .SHOW_TASK_DATETIME_END:
                debugPrint(#file, #function, #line)
                self.openDateTimeView(isOpen: true)
            }
        }.store(in: &cancellable)
        
        vmColor.output.res.sink {
            switch $0 {
            case .SELECTED_COLOR(let color):
                debugPrint(#file, #function, #line, color)
                self.vmTitle.input.req.send(.SELECTED_COLOR(color))
                self.vmReminder.input.req.send(.SELECTED_COLOR(color))
                self.vmRepeatedly.input.req.send(.SELECTED_COLOR(color))
            }
        }.store(in: &cancellable)
        
        vmJob.output.resScroll.sink {
            switch $0 {
            case .SCROLL_TARGET(let target):
                debugPrint(#file, #function, #line)
                self.vScrollGroup.setContentOffset(.init(x: 0, y:  self.vScrollGroup.contentOffset.y + target.height()), animated: true)
            }
        }.store(in: &cancellable)
    }
    
    public override func bindConstraint() {
        vTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview()
        }
        
        vAddEvent.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
        }
        
        vScrollGroup.snp.makeConstraints {
            $0.top.equalTo(vTitle.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(self.view.keyboardLayoutGuide.snp.top)
        }
        
        vTask.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.width.equalTo(self.view.windowBounds().width)
        }
        
        vTaskDateTime.snp.makeConstraints {
            $0.top.equalTo(vTask.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(0)
        }

        vReminder.snp.makeConstraints {
            $0.top.equalTo(vTaskDateTime.snp.bottom)
            $0.left.right.equalToSuperview()
        }
        
        vRepeatedly.snp.makeConstraints {
            $0.top.equalTo(vReminder.snp.bottom)
            $0.left.right.equalToSuperview()
        }
        
        vColor.snp.makeConstraints {
            $0.top.equalTo(vRepeatedly.snp.bottom)
            $0.left.right.equalToSuperview()
        }
        
        vJob.snp.makeConstraints {
            $0.top.equalTo(vColor.snp.bottom)
            $0.left.right.equalToSuperview()
        }
        
        vShare.snp.makeConstraints {
            $0.top.equalTo(vJob.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension ScheduleAddViewContoller {
    private func openDateTimeView(isOpen: Bool) {
        if isOpen {
            vTaskDateTime.snp.remakeConstraints {
                $0.top.equalTo(vTask.snp.bottom)
                $0.left.right.equalToSuperview()
            }
            vTaskDateTime.isHidden = false
        } else {
            vTaskDateTime.snp.remakeConstraints {
                $0.top.equalTo(vTask.snp.bottom)
                $0.left.right.equalToSuperview()
                $0.height.equalTo(0)
            }
            vTaskDateTime.isHidden = true
        }
        
        UIView.animate(withDuration: 0.3) {
            self.vScrollGroup.layoutIfNeeded()
        }
    }
    
    @objc func tapGesture() {
        self.view.endEditing(true)
    }
}

extension ScheduleAddViewContoller: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        vmTitle.output.res.send(.SCROLLING(scrollView.contentOffset.y))
    }
}
