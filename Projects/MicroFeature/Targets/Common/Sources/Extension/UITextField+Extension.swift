//
//  UITextField+Extension.swift
//  CommonFramework
//
//  Created by Jin Salon on 3/8/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit

public extension UITextField {
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
    
    func addPadding(padding: CGFloat) {
        let vPadding = UIView(frame: .init(
            x: 0, y: 0, width: padding, height: height())
        )
        
        leftView = vPadding
        leftViewMode = .always
        
        rightView = vPadding
        rightViewMode = .always
    }
}
