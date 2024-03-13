//
//  UILabel+Extension.swift
//  CoreFamework
//
//  Created by hyunjin on 2023/11/23.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit

extension UILabel {
    public enum CancelLine {
        case ADD(color: UIColor)
        case REMOVE
    }
    
    public func cancelLine(type: CancelLine) {
        let cancelTag = 98981
        switch type {
        case .ADD(let color):
            debugPrint(#file, #function, #line)
            addCancelLine(tag: cancelTag, lineColor: color)
        case .REMOVE:
            debugPrint(#file, #function, #line)
            removeCancelLine(tag: cancelTag)
        }
    }
    
    private func addCancelLine(tag: Int, lineColor: UIColor) {
        guard viewWithTag(tag) == nil else {
            return
        }
        
        let line = UIView(frame: .init(x: 0, y: midY(), width: width(), height: 1))
        line.backgroundColor = lineColor
        addSubview(line)
    }
    
    private func removeCancelLine(tag: Int) {
        guard let vCancelLine = viewWithTag(tag) else {
            return
        }
        
        vCancelLine.removeFromSuperview()
    }
}
