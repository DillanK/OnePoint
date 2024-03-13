//
//  BaseTitleView.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/09.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import CoreFramework

class BaseTopView: BaseView {
    
    static func create() -> BaseTopView {
        return BaseTopView()
    }
    
    private lazy var vSafeArea = {
        UIView().apply {
            $0.backgroundColor = .white
        }
    }()
    
    private lazy var lblTitle = {
        UILabel().apply {
            $0.text = "Label"
        }
    }()
    
    private lazy var btnClose = {
        UIButton().apply {
            $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        }
    }()
    
    lazy var DEF_HEIGHT = {
        return 50 + self.safeArea().top
    }()
    
    override func bindView() {
        addSubview(vSafeArea)
        addSubview(lblTitle)
        addSubview(btnClose)
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        vSafeArea.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(safeArea().top)
        }
        
        btnClose.snp.makeConstraints {
            $0.top.equalTo(vSafeArea.snp.bottom)
            $0.right.bottom.equalToSuperview()
            $0.width.equalTo(50)
        }
        
        lblTitle.snp.makeConstraints {
            $0.top.equalTo(vSafeArea.snp.bottom)
            $0.left.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview()
            $0.right.equalTo(btnClose.snp.left)
        }
    }
}
