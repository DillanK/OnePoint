//
//  NSObject+Extension.swift
//  Core
//
//  Created by hyunjin on 2023/04/05.
//

import UIKit

public protocol ScopeFunc { }

extension ScopeFunc {
    @inline(__always) public func apply(_ closure:(Self) -> ()) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: ScopeFunc { }

extension NSObject {
    
    public func windowBounds() -> CGRect {
        return window()?.bounds ?? .zero
    }
    
    public func safeArea() -> UIEdgeInsets {
        var safeArea = window()?.safeAreaInsets ?? .zero
        if safeArea == .zero {
            safeArea = UIEdgeInsets(top: statusBarFrame().height, left: 0, bottom: 0, right: 0)
        }
        return safeArea
    }
    
    public func window() -> UIWindow? {
        guard #available(iOS 13.0, *) else {
            return UIApplication.shared.windows.first
        }
        
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return scene.windows.first
        }
        
        return nil
    }
    
    public func windowScene() -> UIWindowScene? {
        return UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    
    public func scene() -> UIScene? {
        return UIApplication.shared.connectedScenes.first
    }
    
    public func statusBarFrame() -> CGRect {
        guard #available(iOS 13.0, *) else {
            return UIApplication.shared.statusBarFrame
        }
        
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return scene.statusBarManager?.statusBarFrame ?? .zero
        }
        
        return .zero
    }
    
    public func sizeRatio(referenceValue width: CGFloat = 320) -> CGFloat {
        return windowBounds().width / width
    }
    
    public func keyboardHeight(keyboardSize rect: CGRect) -> CGFloat {
        if isPad() {
            let currentRect = windowBounds()
            let fullRect = UIScreen.main.bounds
            let safeArea = safeArea()
            
            let margin = (fullRect.height - (currentRect.height + safeArea.top)) - rect.height
            
            return margin > 0 ? 0 : abs(margin) + safeArea.bottom
        }
        
        return rect.height
    }
    
    public func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
