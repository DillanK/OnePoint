//
//  CalendarTopView.swift
//  FeatureFramework
//
//  Created by Jin Salon on 3/19/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import BaseFramework
import AssetFramework

class CalendarTopView: BaseView {
    public static func create(vm: CalendarTopViewModel) -> BaseView {
        return CalendarTopView(isBindCall: false).apply {
            $0.backgroundColor = BBColor.paleGrey245.color()
            $0.vm = vm
            $0.initializeCall()
        }
    }
    
    private var vm: CalendarTopViewModel!
    
    private lazy var vYearGroup = {
        UIView()
    }()
    
    private lazy var btnYear = {
        UIButton(type: .system).apply {
            $0.setTitle("2023", for: .normal)
            $0.setTitleColor(BBColor.black51.color(), for: .normal)
            $0.titleLabel?.font = BBFont.NotoSansKR.bold.font(size: 28)
        }
    }()
    
    private lazy var lblYear = {
        UILabel().apply {
            $0.text = "년"
            $0.font = BBFont.NotoSansKR.medium.font(size: 13)
            $0.textColor = BBColor.black51.color()
        }
    }()
    
    private lazy var ivDropDownArrow = {
        UIImageView().apply {
            $0.image = UIImage(systemName: "chevron.down.circle.fill")
            $0.tintColor = BBColor.paleGrey245.color()
        }
    }()
    
    private lazy var btnCalendar = {
        UIButton(type: .system).apply {
            $0.setImage(BBImage.btnMenuMonth.image(), for: .normal)
        }
    }()
    
    private lazy var btnSearch = {
        UIButton(type: .system).apply {
            $0.setImage(BBImage.btnHeaderSearch.image(), for: .normal)
            $0.tintColor = BBColor.buttonBlack.color()
        }
    }()
    
    private lazy var lblSun = {
        UILabel().apply {
            $0.text = "일"
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
            $0.textAlignment = .center
            $0.textColor = BBColor.brownGrey.color()
        }
    }()
    
    private lazy var lblMon = {
        UILabel().apply {
            $0.text = "월"
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
            $0.textAlignment = .center
            $0.textColor = BBColor.brownGrey.color()
        }
    }()
    
    private lazy var lblTus = {
        UILabel().apply {
            $0.text = "화"
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
            $0.textAlignment = .center
            $0.textColor = BBColor.brownGrey.color()
        }
    }()
    
    private lazy var lblWed = {
        UILabel().apply {
            $0.text = "수"
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
            $0.textAlignment = .center
            $0.textColor = BBColor.brownGrey.color()
        }
    }()
    
    private lazy var lblThr = {
        UILabel().apply {
            $0.text = "목"
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
            $0.textAlignment = .center
            $0.textColor = BBColor.brownGrey.color()
        }
    }()
    
    private lazy var lblFri = {
        UILabel().apply {
            $0.text = "금"
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
            $0.textAlignment = .center
            $0.textColor = BBColor.brownGrey.color()
        }
    }()
    
    private lazy var lblSat = {
        UILabel().apply {
            $0.text = "토"
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
            $0.textAlignment = .center
            $0.textColor = BBColor.brownGrey.color()
        }
    }()
    
    override func bindView() {
        vYearGroup.addSubview(btnYear)
        vYearGroup.addSubview(lblYear)
        vYearGroup.addSubview(ivDropDownArrow)
        addSubview(vYearGroup)
        addSubview(btnSearch)
        addSubview(btnCalendar)
        addSubview(lblSun)
        addSubview(lblMon)
        addSubview(lblTus)
        addSubview(lblWed)
        addSubview(lblThr)
        addSubview(lblFri)
        addSubview(lblSat)
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        vm.output.uiEvent.sink {
            switch $0 {
            case .CHANGE_YEAR(let year):
                self.btnYear.setTitle("\(year)", for: .normal)
            }
        }.store(in: &cancellable)
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        btnCalendar.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-12)
            $0.top.equalToSuperview().offset(8 + self.safeArea().top)
            $0.width.height.equalTo(46)
        }
        
        btnSearch.snp.makeConstraints {
            $0.right.equalTo(self.btnCalendar.snp.left).offset(-4)
            $0.top.equalToSuperview().offset(8 + self.safeArea().top)
            $0.width.height.equalTo(46)
        }
        
        vYearGroup.snp.makeConstraints {
            $0.left.equalTo(20)
            $0.top.equalToSuperview().offset(18 + self.safeArea().top)
            $0.height.equalTo(28)
        }
        
        btnYear.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
        }
        
        lblYear.snp.makeConstraints {
            $0.left.equalTo(btnYear.snp.right).offset(3)
            $0.top.bottom.equalToSuperview()
        }
        
        ivDropDownArrow.snp.makeConstraints {
            $0.left.equalTo(lblYear.snp.right).offset(6)
            $0.centerY.equalToSuperview()
        }
        
        lblSun.snp.makeConstraints {
            $0.left.equalToSuperview().offset(9)
            $0.height.equalTo(26)
            $0.width.equalTo(lblMon.snp.width)
            $0.bottom.equalToSuperview()
        }
        
        lblMon.snp.makeConstraints {
            $0.left.equalTo(lblSun.snp.right)
            $0.height.equalTo(26)
            $0.width.equalTo(lblTus.snp.width)
            $0.bottom.equalToSuperview()
        }
        
        lblTus.snp.makeConstraints {
            $0.left.equalTo(lblMon.snp.right)
            $0.height.equalTo(26)
            $0.width.equalTo(lblWed.snp.width)
            $0.bottom.equalToSuperview()
        }
        
        lblWed.snp.makeConstraints {
            $0.left.equalTo(lblTus.snp.right)
            $0.height.equalTo(26)
            $0.width.equalTo(lblThr.snp.width)
            $0.bottom.equalToSuperview()
        }
        
        lblThr.snp.makeConstraints {
            $0.left.equalTo(lblWed.snp.right)
            $0.height.equalTo(26)
            $0.width.equalTo(lblFri.snp.width)
            $0.bottom.equalToSuperview()
        }
        
        lblFri.snp.makeConstraints {
            $0.left.equalTo(lblThr.snp.right)
            $0.height.equalTo(26)
            $0.width.equalTo(lblSat.snp.width)
            $0.bottom.equalToSuperview()
        }
        
        lblSat.snp.makeConstraints {
            $0.left.equalTo(lblFri.snp.right)
            $0.right.equalToSuperview().offset(-9)
            $0.height.equalTo(26)
            $0.width.equalTo(lblSun.snp.width)
            $0.bottom.equalToSuperview()
        }
    }
}
