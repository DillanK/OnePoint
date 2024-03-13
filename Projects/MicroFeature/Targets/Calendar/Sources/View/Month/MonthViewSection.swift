//
//  MonthViewSection.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/12/26.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit
import CoreFramework
import AssetFramework
import SnapKit
import BaseFramework

class MonthViewSection: BaseView {
    static func create() -> MonthViewSection {
        return MonthViewSection(isBindCall: false).apply {
            $0.initializeCall()
        }
    }
    
    lazy var lblMonth = {
        UILabel().apply {
            $0.textColor = BBColor.scheduleTitle.color()
            $0.font = BBFont.NotoSansKR.bold.font(size: 20)
            
        }
    }()
    
    lazy var lblSchedule = {
        UILabel().apply {
            $0.font = BBFont.NotoSansKR.bold.font(size: 12)
            
        }
    }()
    
    lazy var ivScheduleConnector = {
        UIImageView().apply {
            $0.image = UIImage(systemName: "")
        }
    }()
    
    lazy var lblCompleteSchedule = {
        UILabel().apply {
            $0.font = BBFont.NotoSansKR.bold.font(size: 12)
            
        }
    }()
    
    override func bindView() {
        addSubview(lblMonth)
        addSubview(lblSchedule)
        addSubview(lblCompleteSchedule)
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        lblMonth.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
            $0.width.equalTo(50)
        }
    }
}
