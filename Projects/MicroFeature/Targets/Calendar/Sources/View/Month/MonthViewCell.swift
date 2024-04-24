//
//  MonthViewCell.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/12/26.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit
import CoreFramework
import AssetFramework
import BaseFramework

class MonthViewCell: BaseCollectionViewCell<CalendarModelProtocol> {
    lazy var lblDay = {
        UILabel().apply {
            $0.textColor = BBColor.black17.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 14)
            $0.textAlignment = .center
            $0.layer.cornerRadius = 15
            $0.layer.masksToBounds = true
        }
    }()
    
    var data: DailyModel?
    
    override func bindView() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(lblDay)
//        contentView.layer.borderWidth = 1
//        contentView.layer.borderColor = UIColor.black.cgColor
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint() {
        lblDay.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(30)
        }
    }
    
    override func bindData(data: CalendarModelProtocol) {
        if let data = data as? DailyModel {
            self.data = data
            lblDay.text = "\(data.day)"
            if data.weekend == .SAT || data.weekend == .SUN {
                lblDay.textColor = BBColor.grapefruit.color()
            } else {
                lblDay.textColor = BBColor.black17.color()
            }
        } else {
            lblDay.text = ""
        }
    }
    
    func selectCell(isSelected: Bool) {
        if isSelected {
            lblDay.backgroundColor = BBColor.deepSkyBlue.color()
            lblDay.textColor = BBColor.white.color()
            lblDay.font = BBFont.NotoSansKR.bold.font(size: 14)
        } else {
            lblDay.backgroundColor = BBColor.clear.color()
            lblDay.font = BBFont.NotoSansKR.regular.font(size: 14)
            if let validData = data, validData.isHoliday() {
                lblDay.textColor = BBColor.grapefruit.color()
            } else {
                lblDay.textColor = BBColor.black17.color()
            }
        }
    }
}

