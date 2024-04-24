//
//  ScheduleListViewCell.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/20.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit
import CoreFramework
import AssetFramework
import BaseFramework
import CommonFramework

class ScheduleListViewCell: BaseTableViewCell<ScheduleModel> {
    static func calculatorHeight(model: ScheduleModel) -> CGFloat {
        var height: CGFloat = -1//(Constraints.SIDE_MARGIN.value() * 2) + Constraints.DEF_MARGIN.value() + Constraints.TIMELINE_HEIGHT.value() + Constraints.TITLE_HEIGHT.value()
        if let validJob = model.jobs, validJob.isEmpty.not() {
            height = -1
        }
        
        return height
    }
    
    enum Constraints {
        case DEF_SYMBOLE_SIZE
        case DEF_MARGIN
        case SIDE_MARGIN
        case TIMELINE_HEIGHT
        case TIMELINE_TEXT_SIZE
        case TITLE_HEIGHT
        case TITLE_TEXT_SIZE
        case JOB_HEIGHT
        case JOB_SYMBOLE_SIZE
        case JOB_SYMBOLE_TEXT_SIZE
        case COMPLETE_BUTTON
        
        func value() -> CGFloat {
            switch self {
            case .DEF_SYMBOLE_SIZE:
                60 - (Constraints.SIDE_MARGIN.value() * 2)
            case .DEF_MARGIN:
                4
            case .SIDE_MARGIN:
                8
            case .TIMELINE_HEIGHT:
                20
            case .TIMELINE_TEXT_SIZE:
                14
            case .TITLE_HEIGHT:
                24
            case .TITLE_TEXT_SIZE:
                16
            case .JOB_HEIGHT:
                16
            case .JOB_SYMBOLE_SIZE:
                16
            case .JOB_SYMBOLE_TEXT_SIZE:
                14
            case .COMPLETE_BUTTON:
                20
            }
        }
    }
    
    lazy var vSymboleBackground = {
        UIView().apply {
            $0.layer.cornerRadius = 6
            $0.layer.masksToBounds = true
            $0.tintColor = .clear
        }
    }()
    
    lazy var layerTimeProgress = {
        CALayer().apply {
            $0.cornerRadius = 6
            $0.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMinXMaxYCorner)
        }
    }()
    
    lazy var btnCheck = {
        UIButton().apply {
            $0.setImage(BBImage.btnBtnCheckOff.image(), for: .normal)
            $0.setImage(BBImage.btnBtnCheckOn.image(), for: .selected)
            $0.setImage(BBImage.btnBtnCheckDis.image(), for: .disabled)
        }
    }()
    
    lazy var lblTitle = {
        UILabel().apply {
            $0.text = "어린이집 등원하기"
            $0.font = BBFont.NotoSansKR.bold.font(size: 15)
            $0.textColor = BBColor.scheduleTitle.color()
        }
    }()
    
    lazy var lblTime = {
        UILabel().apply {
            $0.font = BBFont.NotoSansKR.regular.font(size: 14)
            $0.textColor = BBColor.scheduleTime.color()
            let attr = NSMutableAttributedString(string: "10:30~14:00")
            attr.addAttribute(.kern, value: -0.32, range: NSMakeRange(0, "10:30~14:00".count))
            $0.attributedText = attr
        }
    }()
    
    lazy var lblJobs = {
        UILabel().apply {
            $0.font = BBFont.NotoSansKR.regular.font(size: 13)
            $0.textColor = BBColor.scheduleJob.color()
            $0.numberOfLines = 0
            $0.text = "-양파2, 대파1\n-우유\n-애호박, 두부"
        }
    }()

    private var model: ScheduleModel?
    
    override func bindView() {
        contentView.backgroundColor = BBColor.white.color()
        contentView.addSubview(vSymboleBackground)
        vSymboleBackground.layer.addSublayer(layerTimeProgress)
        vSymboleBackground.addSubview(btnCheck)
        vSymboleBackground.addSubview(lblTitle)
        vSymboleBackground.addSubview(lblTime)
        vSymboleBackground.addSubview(lblJobs)
//        contentView.addSubview(btnComplete)
        
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint() {
        vSymboleBackground.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
            $0.left.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(-6)
            $0.right.equalToSuperview().offset(-12)
        }
        
        btnCheck.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.left.equalToSuperview().offset(10)
            $0.width.equalTo(24)
            $0.height.equalTo(22)
        }
        
        lblTime.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.right.equalToSuperview().offset(-16)
            $0.width.equalTo(80)
            $0.height.equalTo(18)
        }
        
        lblTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.left.equalTo(btnCheck.snp.right).offset(12)
            $0.right.equalTo(lblTime.snp.left).offset(-12)
            $0.height.equalTo(22)
        }
        
        lblJobs.sizeToFit()
        lblJobs.snp.makeConstraints {
            $0.top.equalTo(lblTitle.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(58)
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-20)
            $0.width.equalTo(lblJobs.frame.width)
            $0.height.equalTo(lblJobs.frame.height)
        }
        
        layerTimeProgress.frame = .init(x: 0, y: 0, width: 50, height: contentView.height() - 12)
    }
    
    override func bindData(data: ScheduleModel) {
        model = data
        reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layerTimeProgress.frame = .init(x: 0, y: 0, width: 150, height: contentView.height() - 12)
    }
    
    private func reloadData() {
        guard let model = model else {
            return
        }
//        vSymboleBackground.backgroundColor = model.symboleColor
//        layerTimeProgress.backgroundColor = model.symboleColor.blendMode(bounds: layerTimeProgress.bounds, mode: .multiply)
        
//        layerTimeProgress.backgroundColor = model.symboleColor.blendMultiply(coverColor: model.symboleColor, alpha: 0.6).cgColor
//        contentView.backgroundColor = model.symboleColor.color()
//        vSymboleBackground.backgroundColor = model.symboleColor.color()
//        ivSymbole.image = UIImage(systemName: model.symboleName)
//        lblTimeLine.text = model.timeLine()
//        lblTitle.text = model.title
//        lblJobCount.text = model.job()
//        
//        UIView.animate(withDuration: 0.3) {
//            if self.model.jobs.isEmpty {
//                self.lblTitle.snp.remakeConstraints {
//                    $0.top.equalTo(self.lblTimeLine.snp.bottom).offset(Constraints.DEF_MARGIN.value())
//                    $0.leading.equalTo(self.vSymboleBackground.snp.trailing).offset(Constraints.SIDE_MARGIN.value())
//                    $0.trailing.equalTo(self.lblTimeLine.snp.leading).offset(-Constraints.SIDE_MARGIN.value())
//                    $0.bottom.equalToSuperview().offset(-Constraints.SIDE_MARGIN.value())
//                }
//                self.ivJobCheck.snp.removeConstraints()
//                self.lblJobCount.snp.removeConstraints()
//            } else {
//                self.lblTitle.snp.remakeConstraints {
//                    $0.top.equalToSuperview().offset(Constraints.DEF_MARGIN.value())
//                    $0.leading.equalTo(self.vSymboleBackground.snp.trailing).offset(Constraints.SIDE_MARGIN.value())
//                    $0.trailing.equalTo(self.lblTimeLine.snp.leading).offset(-Constraints.SIDE_MARGIN.value())
//                    $0.height.equalTo(Constraints.TITLE_HEIGHT.value())
//                }
//                
//                self.ivJobCheck.snp.remakeConstraints {
//                    $0.top.equalTo(self.lblTitle.snp.bottom).offset(Constraints.DEF_MARGIN.value())
//                    $0.leading.equalTo(self.vSymboleBackground.snp.trailing).offset(Constraints.SIDE_MARGIN.value())
//                    $0.size.equalTo(Constraints.JOB_SYMBOLE_SIZE.value())
//                }
//                
////                self.lblJobCount.snp.remakeConstraints {
////                    $0.top.equalTo(self.lblTitle.snp.bottom).offset(Constraints.DEF_MARGIN.value())
////                    $0.leading.equalTo(self.ivJobCheck.snp.trailing).offset(Constraints.DEF_MARGIN.value())
////                    $0.trailing.equalTo(self.btnComplete.snp.leading).offset(-Constraints.SIDE_MARGIN.value())
////                    $0.bottom.equalToSuperview().offset(-Constraints.SIDE_MARGIN.value())
////                }
//            }
//            self.layoutIfNeeded()
//        }
    }
}
