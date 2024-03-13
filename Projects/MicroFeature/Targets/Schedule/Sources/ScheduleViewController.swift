//
//  MainViewController.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/10.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit
import CoreFramework
import AssetFramework
import Combine
import BaseFramework

class ScheduleViewController: BaseViewController {
    
    static func create() -> ScheduleViewController {
        return ScheduleViewController().apply {
            $0.view.backgroundColor = .white
        }
    }
    
    lazy var vAddEasySchedule = {
        AddEasyScheduleView.create()
    }()
    
    var cancellable = Set<AnyCancellable>()
    
    override func bindView() {
        view.addSubview(vAddEasySchedule)
        
        SFSymboleManager.shared.searchSymbole(search: "figure") { searchs in
            debugPrint("Search : \(searchs.first!)")
        }
    }
    
    override func bindConstraint() {

    }
}
