//
//  AddEasyScheduleView.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/10.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit
import CoreFramework
import SnapKit
import Combine
import BaseFramework
import AssetFramework

class AddEasyScheduleView: BaseView {
    static func create(type: AddEasyType = .ADD) -> AddEasyScheduleView {
        AddEasyScheduleView(isBindCall: false).apply {
            debugPrint(#file, #function, #line, "AddEasyScheduleView Apply")
//            $0.sharedDataViewModel = sharedDataViewModel
            $0.backgroundColor = .clear
            $0.type = type
            $0.initializeCall()
        }
    }
    
    private lazy var vBackground = {
        UIView().apply {
            $0.backgroundColor = BBColor.white.color()
            $0.layer.cornerRadius = 6
            $0.layer.borderColor = BBColor.brownGrey102.color().cgColor
            $0.layer.borderWidth = 1
            $0.isHidden = true
        }
    }()
    
    private lazy var lblTitle = {
        UILabel().apply {
            $0.text = "일정추가"
            $0.textColor = BBColor.brownGrey.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
            $0.backgroundColor = BBColor.white.color()
            $0.textAlignment = .center
            $0.isHidden = true
        }
    }()
    
    private lazy var btnAdd = {
        UIButton().apply {
            $0.addTarget(self, action: #selector(eventType), for: .touchUpInside)
            $0.setImage(BBImage.mobileIconMainCaster.image(), for: .normal)
            $0.titleLabel?.font = BBFont.NotoSansKR.medium.font(size: 14)
            $0.imageView?.contentMode = .scaleAspectFill
        }
    }()
    
    private lazy var btnType = {
        UIButton().apply {
            $0.addTarget(self, action: #selector(eventType), for: .touchUpInside)
            $0.setTitle("상세 +", for: .normal)
            $0.titleLabel?.font = BBFont.NotoSansKR.medium.font(size: 14)
            $0.setTitleColor(BBColor.deepSkyBlue.color(), for: .normal)
            $0.isHidden = true
        }
    }()
    
    private lazy var tfName = {
        UITextField().apply {
            $0.textColor = .white
            $0.font = BBFont.NotoSansKR.regular.font(size: 24)
            $0.isHidden = true
            $0.returnKeyType = .done
            $0.borderStyle = .none
        }
    }()
    
    private lazy var vNameUnderLine = {
        UIView().apply {
            $0.backgroundColor = .white
            $0.isHidden = true
        }
    }()
    
//    private var sharedDataViewModel: SharedDataViewModel!
    
    /// 현재 상태 정보를 저장
    private var type: AddEasyType = .ADD
    private var state: FoldState = .IN
    private var keyboardSize: CGRect = .zero
    
    private let DEF_WIDTH: CGFloat = 48
    private let DEF_HEIGHT: CGFloat = 48
    private let DEF_MARGIN: CGFloat = 12
    private let DEF_BOTTOM_MARGIN: CGFloat = 32
    private var cancelable = Set<AnyCancellable>()
    
    override func bindView() {
        addSubview(vBackground)
        addSubview(lblTitle)
        addSubview(btnAdd)
        vBackground.addSubview(btnType)
        vBackground.addSubview(tfName)
        vBackground.addSubview(vNameUnderLine)
    }
    
    override func bindCombine() {
        
//        NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification).sink { notification in
//            debugPrint(#file, #function, #line, "Background : \(self.vBackground)")
////            self.snp.remakeConstraints {
////                $0.height.equalTo(abs(self.vBackground.frame.origin.y) + self.vBackground.frame.height + self.safeArea().bottom)
////                $0.width.equalTo(self.windowBounds().width - (self.DEF_MARGIN * 2))
////                $0.right.equalToSuperview().offset(-self.DEF_MARGIN)
////                $0.bottom.equalTo(self.keyboardLayoutGuide.snp.top)//equalToSuperview().offset(-self.keyboardLayoutGuide.layoutFrame.height)
////            }
//            UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut) {
//                self.superview?.layoutIfNeeded()
//            }
//        }.store(in: &cancelable)
        
//        sharedDataViewModel?.output.result.sink { result in
//            switch result {
//            case .selectedColor(let model):
//                self.vBackground.backgroundColor = model.color()
//                self.btnType.tintColor = model.color().changeTintColor()
//                self.tfName.textColor = model.color().changeTintColor()
//                self.vNameUnderLine.backgroundColor = model.color().changeTintColor()
//            }
//        }.store(in: &cancelable)
    }
    
    override func bindEvent() {
        tfName.delegate = self
        
//        // iPad 인경우 사이즈 변경에 대한 이벤트를 받음
//        if isPad() {
//            windowScene()?.delegate = self
//        }
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        vBackground.snp.remakeConstraints {
            $0.top.equalToSuperview().offset(9)
            $0.leading.equalToSuperview().offset(9)
            $0.trailing.equalToSuperview().offset(-12)
            if state == .IN {
                $0.height.equalTo(DEF_HEIGHT)
            } else if state == .OUT {
                $0.height.equalTo(60)
            }
        }
        
        lblTitle.snp.remakeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(18)
            $0.width.equalTo(52)
            $0.height.equalTo(18)
        }
        
        btnAdd.snp.remakeConstraints {
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(DEF_WIDTH)
            $0.height.equalTo(DEF_HEIGHT)
        }
        
        btnType.snp.remakeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(DEF_WIDTH)
            $0.height.equalTo(18)
            $0.right.equalToSuperview().offset(-(self.DEF_WIDTH / 4))
        }

        self.snp.remakeConstraints {
            if state == .IN {
                $0.width.equalTo(DEF_WIDTH)
                $0.height.equalTo(DEF_HEIGHT)
                $0.bottom.equalToSuperview().offset(-self.safeArea().bottom)
            } else if state == .OUT {
                $0.height.equalTo(DEF_HEIGHT)
                $0.width.equalTo(self.windowBounds().width - (DEF_MARGIN * 2))
                $0.bottom.equalTo(self.keyboardLayoutGuide.snp.top)
            }
            $0.right.equalToSuperview().offset(-DEF_MARGIN)
        }
    }
}

extension AddEasyScheduleView {
    @objc func eventType() {
        debugPrint(#file, #function, #line)
        
        switch state {
        case .IN:
            foldOut()
        case .OUT:
            foldIn()
        }
    }
    
    /// 입력 UI를 숨긴다.
    private func foldIn() {
        state = .IN
        type = .ADD
        tfName.resignFirstResponder()
        
        animateFoldInWithName()
        animateFoldIn()
    }
    
    /// 입력 UI를 보여준다.
    private func foldOut() {
        state = .OUT
        type = .INPUT
        self.tfName.becomeFirstResponder()
    }
}

extension AddEasyScheduleView {
    // Fold IN
    private func animateFoldIn() {
        self.lblTitle.isHidden = true
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.vBackground.snp.remakeConstraints {
                $0.top.leading.trailing.equalToSuperview()
                $0.height.equalTo(self.type.viewHeight())
            }
            
            self.snp.updateConstraints {
                $0.width.height.equalTo(self.type.viewHeight())
            }

            self.superview?.layoutIfNeeded()
        }
    }
    
    private func animateFoldInWithName() {
        btnAdd.isHidden = false
        tfName.isHidden = true
        vBackground.isHidden = true
        vNameUnderLine.isHidden = true
        tfName.snp.removeConstraints()
        vNameUnderLine.snp.removeConstraints()
        layoutIfNeeded()
    }
    
    // Fold Out
    private func animateFoldOut() {
        btnAdd.isHidden = true
        vBackground.isHidden = false
        btnType.isHidden = false
        lblTitle.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut) {
            
            self.vBackground.snp.remakeConstraints {
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(60)
            }

            self.snp.remakeConstraints {
                $0.width.equalTo(self.windowBounds().width - (self.DEF_MARGIN * 2))
                $0.height.equalTo(self.type.viewHeight())
                $0.right.equalToSuperview().offset(-self.DEF_MARGIN)
                $0.bottom.equalTo(self.keyboardLayoutGuide.snp.top)
            }
            
//            self.btnType.snp.remakeConstraints {
//                $0.centerY.equalToSuperview()
//                $0.width.equalTo(self.DEF_WIDTH)
//                $0.height.equalTo(18)
//                $0.right.equalToSuperview().offset(-(self.DEF_WIDTH / 4))
//            }

            self.layoutIfNeeded()
            self.superview?.layoutIfNeeded()
        } completion: { isComplete in
            self.lblTitle.isHidden = false
        }
    }
    
    private func animateFoldOutWithName() {
        lblTitle.isHidden = false
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.lblTitle.alpha = 1
            self.tfName.snp.remakeConstraints {
                $0.top.equalToSuperview()//.offset(self.type.viewHeight()/4)
                $0.leading.equalTo(self.vBackground.snp.leading).offset(self.DEF_MARGIN)
                $0.trailing.equalTo(self.vBackground.snp.trailing).offset(-self.DEF_MARGIN)
                $0.height.equalTo(self.type.viewHeight()/2)
            }
            
            self.vNameUnderLine.snp.remakeConstraints {
                $0.leading.equalTo(self.tfName.snp.leading)
                $0.top.equalTo(self.tfName.snp.bottom)
                $0.height.equalTo(1)
            }

            self.layoutIfNeeded()
        } completion: { isComplete in
            self.tfName.isHidden = false
            self.vNameUnderLine.isHidden = false
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.vNameUnderLine.snp.remakeConstraints {
                    $0.leading.equalTo(self.tfName.snp.leading)
                    $0.trailing.equalTo(self.tfName.snp.trailing)
                    $0.top.equalTo(self.tfName.snp.bottom)
                    $0.height.equalTo(1)
                }

                self.layoutIfNeeded()
            }
        }
    }
}

extension AddEasyScheduleView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        foldIn()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateFoldOut()
        animateFoldOutWithName()
    }
}

//extension AddEasyScheduleView: UIWindowSceneDelegate {
//    func windowScene(_ windowScene: UIWindowScene, didUpdate previousCoordinateSpace: UICoordinateSpace, interfaceOrientation previousInterfaceOrientation: UIInterfaceOrientation, traitCollection previousTraitCollection: UITraitCollection) {
//        debugPrint(#file, #function, #line, "\(previousCoordinateSpace.bounds)     \(windowScene.effectiveGeometry)")
//        setNeedsUpdateConstraints()
//    }
//}
