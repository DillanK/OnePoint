//
//  UIView+Extension.swift
//  Core
//
//  Created by hyunjin on 2023/04/27.
//

import UIKit

extension UIView {
    public func width() -> CGFloat {
        return frame.width
    }
    
    public func height() -> CGFloat {
        return frame.height
    }
    
    public func maxX() -> CGFloat {
        return frame.maxX
    }
    
    public func maxY() -> CGFloat {
        return frame.maxY
    }
    
    public func minX() -> CGFloat {
        return frame.minX
    }
    
    public func minY() -> CGFloat {
        return frame.minY
    }
    
    public func midX() -> CGFloat {
        return frame.midX
    }
    
    public func midY() -> CGFloat {
        return frame.midY
    }
    
    public func size() -> CGSize {
        return frame.size
    }
}
