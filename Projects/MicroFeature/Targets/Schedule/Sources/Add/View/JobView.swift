//
//  JobView.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/8/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import BaseFramework
import CommonFramework
import AssetFramework
import LocalizeStringFramework
import SnapKit

class JobView: BaseView {
    static func create() -> BaseView {
        return JobView(isBindCall: false).apply {
            $0.backgroundColor = BBColor.white.color()
            $0.initializeCall()
            $0.makeDetailInput(rootView: $0.vInputGroup)
        }
    }
    
    private lazy var lblJob = {
        UILabel().apply {
            $0.text = BBString.detail
            $0.textColor = BBColor.brownGrey.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
        }
    }()
    
    private lazy var vInputTable = {
        UITableView()
    }()
    
    private lazy var vInputGroup = {
        UIView()
    }()

    override func bindView() {
        addSubview(lblJob)
        addSubview(vInputTable)
        addSubview(vInputGroup)
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        lblJob.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
            $0.height.equalTo(18)
        }
        
        vInputTable.snp.makeConstraints {
            $0.top.equalTo(lblJob.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(22)
            $0.right.equalToSuperview().offset(-22)
        }
        
        vInputGroup.snp.makeConstraints {
            $0.top.equalTo(vInputTable.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(22)
            $0.right.equalToSuperview().offset(-22)
            $0.height.equalTo(42)
            $0.bottom.equalToSuperview()
        }
    }
}

extension JobView {
    func makeDetailInput(rootView: UIView) {
        let tf = makeTextField()
        let btn = makeButton()
        let view = UIView()
        view.addSubview(btn)
        view.addSubview(tf)
        rootView.addSubview(view)
        
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        btn.snp.makeConstraints {
            $0.right.equalToSuperview()
            $0.size.equalTo(26)
            $0.centerY.equalToSuperview()
        }
        
        tf.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
            $0.right.equalTo(btn.snp.left).offset(-8)
            $0.height.equalTo(42)
        }
    }
    
    private func makeTextField() -> UITextField {
        return UITextField().apply {
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.placeholder = "세부사항을 입력해주세요."
            $0.setPlaceholderColor(BBColor.veryLightPink187.color())
            $0.addPadding(padding: 10)
        }
    }
    
    private func makeButton() -> UIButton {
        return UIButton().apply {
            $0.setImage(BBImage.iconInputAdd.image(), for: .normal)
        }
    }
}
