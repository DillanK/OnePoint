//
//  SampleViewController.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/17.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit
import SnapKit
import Combine
import CalendarFramework
import BaseFramework
import CoreFramework

class SampleViewController: BaseViewController {
    static func create() -> SampleViewController {
        return SampleViewController().apply {
            $0.view.backgroundColor = .white
        }
    }
    
    enum Constraints {
        case DEF_MARGIN
        case COLOR_SPACE
        case SCHEDULE_LIST
        case WEEKEND
        case MONTHLY
        
        func value() -> CGFloat {
            switch self {
            case .DEF_MARGIN:
                8
            case .COLOR_SPACE:
                40
            case .SCHEDULE_LIST:
                300
            case .WEEKEND:
                80
            case .MONTHLY:
                500
            }
        }
    }
    
//    lazy var vAddEasySchedule = {
//        AddEasyScheduleView.create(sharedDataViewModel: sharedDataViewModel)
//    }()
//    
//    lazy var vColor = {
//        ColorView.create(symboleName: "bag.circle", sharedDataViewModel: sharedDataViewModel)
//    }()
//    
//    lazy var vScheduleList = {
//        ScheduleListView.create()
//    }()
    
    lazy var vWeekend = {
        CalendarProxy.loadWeekend()
    }()
    
    lazy var vMonthly = {
        CalendarProxy.loadMonthly()
    }()
    
//    lazy var sharedDataViewModel = {
//        SharedDataViewModel(self.cancellable)
//    }()
    
    private var cancellable = Set<AnyCancellable>()
    
    override func bindView() {
//        view.addSubview(vColor)
//        view.addSubview(vAddEasySchedule)
//        view.addSubview(vScheduleList)
        view.addSubview(vWeekend.view())
        view.addSubview(vMonthly.view())
        
//        vColor.isHidden = true
//        vAddEasySchedule.isHidden = false
//        vScheduleList.isHidden = true
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
//        sharedDataViewModel.output.result.sink { result in
//            switch result {
//            case .selectedColor(let model):
//                debugPrint(#file, #function, #line, "ColorModel : \(model.description)")
//            }
//        }.store(in: &cancellable)
    }
    
    override func bindConstraint() {
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
//        vColor.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(self.safeArea().top)
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(Constraints.COLOR_SPACE.value())
//        }
//        
//        vScheduleList.snp.makeConstraints {
//            $0.top.equalTo(vColor.snp.bottom).offset(Constraints.DEF_MARGIN.value() * 2)
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(Constraints.SCHEDULE_LIST.value())
//        }
        
        vWeekend.view().snp.makeConstraints {
            $0.top.equalToSuperview().offset(self.safeArea().top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constraints.WEEKEND.value())
        }
        
        vMonthly.view().snp.makeConstraints {
            $0.top.equalTo(vWeekend.view().snp.bottom).offset(Constraints.DEF_MARGIN.value() * 2)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constraints.MONTHLY.value())
        }
    }
}

extension SampleViewController {
//    func reloadCustomColor(_ model: ColorModel) {
//        
//    }
}
