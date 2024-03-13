//
//  ColorViewCell.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/10/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import BaseFramework
import CommonFramework

class ColorViewCell: BaseCollectionViewCell<UIColor> {
    
    private lazy var vColor = {
        UIView()
    }()
    
    override func bindView() {
        contentView.backgroundColor = .clear
        contentView.addSubview(vColor)
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint() {
        vColor.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func bindData(data: UIColor) {
        vColor.layer.borderColor = data.blendMultiply(
            coverColor: data, alpha: 0.6
        ).cgColor
        vColor.layer.borderWidth = 1
        vColor.backgroundColor = data
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        vColor.layer.cornerRadius = contentView.width()/2
    }
}
