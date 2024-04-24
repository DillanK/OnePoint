//
//  ShareView.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/11/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import BaseFramework
import CommonFramework
import AssetFramework
import LocalizeStringFramework
import SnapKit

class ShareView: BaseView {
    static func create() -> BaseView {
        return ShareView(isBindCall: false).apply {
            $0.backgroundColor = BBColor.white.color()
            $0.initializeCall()
            $0.makeShareInfo(rootView: $0.vShareGroup)
        }
    }
    
    private lazy var lblJob = {
        UILabel().apply {
            $0.text = BBString.share
            $0.textColor = BBColor.brownGrey.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
        }
    }()
    
    private lazy var vShareGroup = {
        UIView()
    }()
    
    override func bindView() {
        addSubview(lblJob)
        addSubview(vShareGroup)
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
        
        vShareGroup.snp.makeConstraints {
            $0.top.equalTo(lblJob.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(22)
            $0.right.equalToSuperview().offset(-22)
            $0.height.equalTo(36)
            $0.bottom.equalToSuperview()
        }
    }
}

extension ShareView {
    func makeShareInfo(rootView: UIView) {
        let btn = makeButton()
        let view = UIView()
        view.addSubview(btn)
        rootView.addSubview(view)
        
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        btn.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.size.equalTo(36)
        }
    }
    
    private func makeButton() -> UIButton {
        return UIButton(type: .system).apply {
            $0.setTitle("+", for: .normal)
            $0.setTitleColor(BBColor.black17.color(), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
            $0.layer.cornerRadius = 36 / 2
            $0.backgroundColor = BBColor.paleGrey245.color()
            $0.tintColor = BBColor.black17.color()
        }
    }
}
