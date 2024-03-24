//
//  JobViewCell.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/13/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//
import UIKit
import BaseFramework
import AssetFramework

class JobViewCell: BaseTableViewCell<JobModel> {
    private lazy var tfJob = {
        UITextField().apply {
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.addPadding(padding: 10)
            $0.isEnabled = false
        }
    }()
    
    private lazy var btnRemove = {
        UIButton().apply {
            $0.setImage(BBImage.iconInputDeelete.image(), for: .normal)
            $0.tintColor = BBColor.black.color()
        }
    }()
    
    override func bindView() {
        contentView.addSubview(tfJob)
        contentView.addSubview(btnRemove)
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint() {
        btnRemove.snp.makeConstraints {
            $0.size.equalTo(26)
            $0.right.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        tfJob.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
            $0.right.equalTo(btnRemove.snp.left)
            $0.height.equalTo(42)
        }
        
        contentView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-4)
        }
    }
    
    override func bindData(data: JobModel) {
        tfJob.text = data.text
    }
}
