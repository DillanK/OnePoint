//
//  BaseTableViewCell.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/16.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit

open class BaseTableViewCell<T>: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bindView()
        bindEvent()
        bindCombine()
        setNeedsUpdateConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func updateConstraints() {
        bindConstraint()
        super.updateConstraints()
    }

    /// Init Call Step1(View addSubview 등 처리)
    open func bindView() { }
    
    /// Init Call Step2(delegate, action 설정 처리)
    open func bindEvent() { }
    
    /// Init Call Step3(Combine, Delegate 제약사항 추가)
    open func bindCombine() { }
    
    /// Init Call Step4(View의 위치 및 제약사항 추가)
    open func bindConstraint() { }
    
    /// 데이터 구성 처리
    open func bindData(data: T) { }
}
