//
//  MonthTitleViewCell.swift
//  FeatureFamework
//
//  Created by hyunjin on 2024/01/05.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import AssetFramework
import SnapKit
import BaseFramework

class MonthTitleViewCell: BaseCollectionViewCell<CalendarModelProtocol> {
    
    lazy var lblMonth = {
        UILabel().apply {
            $0.textColor = BBColor.scheduleTitle.color()
        }
    }()
    
    lazy var lblJob = {
        UILabel().apply {
            $0.textColor = BBColor.scheduleTitle.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 14)
        }
    }()
//    
//    lazy var lblJobCount = {
//        UILabel().apply {
//            $0.textColor = BBPastelColor.c4D80E4.color()
//        }
//    }()
    
    lazy var lblJobComplte = {
        UILabel().apply {
            $0.textColor = BBColor.scheduleTitle.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 14)
        }
    }()
    
    override func bindView() {
        contentView.addSubview(lblMonth)
        contentView.addSubview(lblJob)
        contentView.addSubview(lblJobComplte)
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint() {
        lblJobComplte.snp.makeConstraints {
            $0.right.top.bottom.equalToSuperview()
        }
        
        lblJob.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.equalTo(lblJobComplte.snp.left).offset(-8)
        }

        lblMonth.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
            $0.right.equalTo(lblJob.snp.left)
        }
    }
    
    override func bindData(data: CalendarModelProtocol) {
        guard let model = data as? MonthlyModel else {
            return
        }
        
        let stringJob = "일정 : 10건"
        let stringComplte = "완료 : 3건"
        
        let attributeJob = NSMutableAttributedString(string: stringJob)
        attributeJob.addAttribute(
            .foregroundColor,
            value: BBPastelColor.c4D80E4.color(),
            range: (stringJob as NSString).range(of: "10")
        )
        attributeJob.addAttribute(
            .font,
            value: BBFont.NotoSansKR.regular.font(size: 15),
            range: (stringJob as NSString).range(of: "10")
        )
        
        let attributeJobComplete = NSMutableAttributedString(string: stringComplte)
        attributeJobComplete.addAttribute(
            .foregroundColor,
            value: BBPastelColor.c4D80E4.color(),
            range: (stringJob as NSString).range(of: "10")
        )
        attributeJobComplete.addAttribute(
            .font, 
            value: BBFont.NotoSansKR.regular.font(size: 15),
            range: (stringJob as NSString).range(of: "10")
        )
        
        lblMonth.text = "\(model.year)년 \(model.month.value())월"
        lblJob.attributedText = attributeJob
        lblJobComplte.attributedText = attributeJobComplete
        
        setNeedsUpdateConstraints()
    }
}
