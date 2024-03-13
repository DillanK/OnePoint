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
        TopView.create(viewModel: self.topViewModel)
    }()
    
    lazy var vSelectedDate = {
        SelectedDateView.create(viewModel: self.selectedDateViewModel)
    }()
    
    lazy var topViewModel = {
        TopViewModel(self.cancellable)
    }()
    
    lazy var selectedDateViewModel = {
        SelectedDateViewModel(self.cancellable)
    }()
    
    lazy var vScheduleList = {
        ScheduleProxy.loadScheduleList()
    }()
    
    private var cancellable = Set<AnyCancellable>()
    
    override func bindView() {
        view.addSubview(vTop)
        view.addSubview(vSelectedDate)
        view.addSubview(vScheduleList)
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        topViewModel.output.clickEvent.sink {
            switch $0 {
            case .ADD_SCHEDULE:
                debugPrint(#file, #function, #line)
                self.showAddSchedule()
            case .SETTING:
                debugPrint(#file, #function, #line)
            case .SEARCH:
                debugPrint(#file, #function, #line)
            }
        }.store(in: &cancellable)
    }
    
    override func bindConstraint() {
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
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
}

extension HomeViewController {
    func showAddSchedule() {
        present(ScheduleAddViewContoller.create(), animated: true)
    }
}
