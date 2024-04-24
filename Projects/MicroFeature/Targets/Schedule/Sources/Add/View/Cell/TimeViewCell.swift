//
//  TimeViewCell.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/27/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import SnapKit
import BaseFramework
import AssetFramework

class TimeViewCell: BaseCollectionViewCell<Int> {
    
    lazy var lblTime = {
        UILabel().apply {
            $0.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.textColor = BBColor.black51.color()
            $0.textAlignment = .center
            $0.backgroundColor = BBColor.white.color()
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 4
            $0.layer.borderWidth = 1
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
        }
    }()
    
    override func bindView() {
        contentView.addSubview(lblTime)
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint() {
        lblTime.snp.makeConstraints {
            $0.left.top.equalToSuperview()
            $0.right.bottom.equalToSuperview()
        }
    }
    
    override func bindData(data: Int) {
        lblTime.text = String(format: "%02d", data)
    }
    
    func selected() {
        lblTime.textColor = BBColor.deepSkyBlue.color()
        lblTime.layer.borderColor = BBColor.deepSkyBlue.color().cgColor
    }
    
    func unSelected() {
        lblTime.textColor = BBColor.black51.color()
        lblTime.layer.borderColor = BBColor.veryLightPink226.color().cgColor
    }
}

