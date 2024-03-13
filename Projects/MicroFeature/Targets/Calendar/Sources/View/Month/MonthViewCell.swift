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
            $0.textColor = BBColor.scheduleTitle.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 10)
            $0.numberOfLines = 0
        }
    }()
    
    override func bindView() {
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
            $0.edges.equalToSuperview()
        }
    }
    
    override func bindData(data: CalendarModelProtocol) {
        if let data = data as? DailyModel {
            lblDay.text = "\(data.year)\n\(data.month.value()).\(data.day)"
            contentView.backgroundColor = .white
        } else {
            lblDay.text = ""
            contentView.backgroundColor = .red
        }
    }
}

