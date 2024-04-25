//
//  HomeViewController.swift
//  FeatureFramework
//
//  Created by Jin Salon on 3/1/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import SnapKit
import BaseFramework
import Combine
import AssetFramework
import ScheduleFramework

class HomeViewController: BaseViewController {
    
    public static func create() -> BaseViewController {
        return HomeViewController().apply {
            $0.view.backgroundColor = BBColor.white.color()
        }
    }
    
    lazy var vTop = {
        TopView.create(viewModel: self.vmTop)
    }()
    
    lazy var vSelectedDate = {
        SelectedDateView.create(vm: self.vmSelectedDate)
    }()
    
    lazy var vmTop = {
        TopViewModel(self.cancellable)
    }()
    
    lazy var vmSelectedDate = {
        SelectedDateViewModel(self.cancellable)
    }()
    
    lazy var vScheduleList = {
        ScheduleProxy.loadScheduleList()
    }()
    
    lazy var vEasyAddSchedule = {
        ScheduleProxy.loadEasyScheduleView()
    }()
    
    private var cancellable = Set<AnyCancellable>()
    
    override func bindView() {
        view.addSubview(vTop)
        view.addSubview(vSelectedDate)
        view.addSubview(vScheduleList)
        view.addSubview(vEasyAddSchedule)
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        vmTop.output.observeResponse.sink {
            switch $0 {
            case .ADD_SCHEDULE:
                debugPrint(#file, #function, #line)
                self.showAddSchedule(self.vmSelectedDate.selectedDate)
            case .SETTING:
                debugPrint(#file, #function, #line)
            case .SEARCH:
                debugPrint(#file, #function, #line)
            }
        }.store(in: &cancellable)
        
//        vmSelectedDate.output.observeResponse.sink {
//            switch $0 {
//            case .NONE:
//                debugPrint(#file, #function, #line)
//            case .LOAD_SCHEDULE:
//                debugPrint(#file, #function, #line)
//            case .SHOW_CALENDAR:
//                debugPrint(#file, #function, #line)
//                self.present(CalendarViewController.create(), animated: true)
//            }
//        }.store(in: &cancellable)
    }
    
    override func bindConstraint() {
        vTop.snp.makeConstraints {
            $0.top.equalTo(self.safeArea().top)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(46)
        }
        
        vSelectedDate.snp.makeConstraints {
            $0.top.equalTo(vTop.snp.bottom)
            $0.left.right.equalToSuperview()
        }
        
        vScheduleList.snp.makeConstraints {
            $0.top.equalTo(vSelectedDate.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vmSelectedDate.input.observeRequest.send(.SELECTED_DATE(Date.now))
    }
}

extension HomeViewController {
    func showAddSchedule(_ selectedDate: Date) {
        present(ScheduleAddViewContoller.create(selectedDate), animated: true)
    }
}
