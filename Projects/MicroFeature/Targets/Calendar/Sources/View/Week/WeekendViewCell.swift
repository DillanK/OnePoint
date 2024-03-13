//
//  WeekendCell.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/27.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit
import AssetFramework
import BaseFramework

class WeekendViewCell: BaseCollectionViewCell<DailyModel> {
    enum Constraints {
        case DAY
        case LINE
        case WEEKEND
        
        func value() -> CGFloat {
            switch self {
            case .DAY:
                return 39
            case .LINE:
                return 1
            case .WEEKEND:
                return 20
            }
        }
    }
    
    static func calculatorHeight() -> CGFloat {
        return Constraints.DAY.value() + Constraints.LINE.value() + Constraints.WEEKEND.value()
    }
    
    lazy var lblDay = {
        UILabel().apply {
            $0.textColor = BBColor.scheduleTitle.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 10)
            $0.numberOfLines = 0
        }
    }()
    
    lazy var vLine = {
        UIView()
    }()
    
    lazy var lblWeekend = {
        UILabel()
    }()
    
    override func bindView() {
        contentView.backgroundColor = BBColor.random.randomColor()
        contentView.addSubview(lblDay)
        contentView.addSubview(vLine)
        contentView.addSubview(lblWeekend)
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint() {
        lblWeekend.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        vLine.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(lblWeekend.snp.top)
            $0.height.equalTo(1)
        }
        
        lblDay.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.bottom.equalTo(vLine.snp.top)
        }
    }
    
    override func bindData(data: DailyModel) {
        debugPrint(data.description)
        lblDay.text = "\(data.year).\(data.month.value()).\(data.day)"
        lblWeekend.text = data.weekend.localString()
    }
}

