//
//  UIColor+Extension.swift
//  CoreFamework
//
//  Created by hyunjin on 2023/11/13.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit

extension UIColor {
    public func changeTintColor() -> UIColor {
        guard let components = self.cgColor.components else {
            return .white
        }
        
        let red: CGFloat = components[0]
        let green: CGFloat = components[1]
        let blue: CGFloat = components[2]
        
        let luma = 0.2126 * (red * 255) + 0.7152 * (green * 255) + 0.0722 * (blue * 255)
        return luma < 191.25 ? .white : .black
    }
}

