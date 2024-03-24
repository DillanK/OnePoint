//
//  CalendarViewController.swift
//  FeatureFramework
//
//  Created by Jin Salon on 3/19/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import BaseFramework
import AssetFramework
import CalendarFramework
import Combine

class CalendarViewController: BaseViewController {
    public static func create() -> BaseViewController {
        return CalendarViewController().apply {
            $0.modalPresentationStyle = .fullScreen
            $0.view.backgroundColor = BBColor.white.color()
        }
    }
    
    private var cancellable = Set<AnyCancellable>()
    
    lazy var vmCalendarTop = {
        CalendarTopViewModel(self.cancellable)
    }()
    
    lazy var vCalendarTop = {
        CalendarTopView.create(vm: self.vmCalendarTop)
    }()
    
    lazy var vMonthly = {
        CalendarProxy.loadMonthly()
    }()
    
    override func bindView() {
        view.addSubview(vCalendarTop)
        view.addSubview(vMonthly.view())
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        vMonthly.centerDateInfo { year in
            self.vmCalendarTop.input.uiEvent.send(.CHANGE_YEAR(year))
        }
    }
    
    override func bindConstraint() {
        vCalendarTop.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
            $0.height.equalTo(107 + self.view.safeArea().top)
        }
        
        vMonthly.view().snp.makeConstraints {
            $0.top.equalTo(vCalendarTop.snp.bottom)
            $0.left.bottom.right.equalToSuperview()
        }
    }
}
