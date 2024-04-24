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
    
    lazy var ivBg = {
        UIImageView().apply {
            $0.backgroundColor = BBColor.clear.color()
            $0.layer.cornerRadius = 40 / 2
            $0.layer.shadowOffset = .init(width: 0, height: 0)
            $0.layer.shadowRadius = 2.5  // blur
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 0.3
        }
    }()
    
    lazy var lblDay = {
        UILabel().apply {
            $0.layer.masksToBounds = true
            $0.textColor = BBColor.black17.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 14)
            $0.textAlignment = .center
        }
    }()
    
    var model: DailyModel?
    
    override func bindView() {
        contentView.addSubview(ivBg)
        contentView.addSubview(lblDay)
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint() {
        lblDay.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        ivBg.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(40)
        }
    }
    
    override func bindData(data: DailyModel) {
        model = data
        lblDay.text = "\(data.day)"
    }
    
    func selected() {
        ivBg.backgroundColor = BBColor.deepSkyBlue.color()
        lblDay.textColor = BBColor.white.color()
    }
    
    func unSelected() {
        ivBg.backgroundColor = BBColor.clear.color()
        
        guard let validModel = model else {
            return
        }
        
        if validModel.weekend == .SAT {
            lblDay.textColor = BBColor.deepSkyBlue.color()
        } else if validModel.weekend == .SUN {
            lblDay.textColor = BBColor.grapefruit.color()
        } else {
            lblDay.textColor = BBColor.black17.color()
        }
    }
}

