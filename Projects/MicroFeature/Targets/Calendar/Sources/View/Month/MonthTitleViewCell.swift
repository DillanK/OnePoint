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
            $0.textColor = BBColor.black17.color()
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
    
    lazy var vLine = {
        UIView().apply {
            $0.backgroundColor = BBColor.veryLightPink187.color()
        }
    }()
    
    override func bindView() {
        contentView.addSubview(lblMonth)
        contentView.addSubview(lblJob)
        contentView.addSubview(lblJobComplte)
        contentView.addSubview(vLine)
        
        lblJob.isHidden = true
        lblJobComplte.isHidden = true
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
            $0.left.equalToSuperview().offset(13)
            $0.top.bottom.equalToSuperview()
            $0.right.equalTo(lblJob.snp.left)
        }
        
        vLine.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-11)
            $0.height.equalTo(2)
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
        
        let month = "\(model.month.value())"
        let attributeMonth = NSMutableAttributedString(string: "\(model.month.value()) 월")
        attributeMonth.addAttribute(
            .font,
            value: BBFont.NotoSansKR.bold.font(size: 24),
            range: NSMakeRange(0, month.count)
        )
        attributeMonth.addAttribute(
            .font,
            value: BBFont.NotoSansKR.medium.font(size: 13),
            range: NSMakeRange(month.count + 1, 1)
        )
        lblMonth.attributedText = attributeMonth
        lblJob.attributedText = attributeJob
        lblJobComplte.attributedText = attributeJobComplete
        
        setNeedsUpdateConstraints()
    }
}
