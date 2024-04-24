//
//  TaskDateTimeView.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/27/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import BaseFramework
import SnapKit
import AssetFramework
import CalendarFramework

class TaskDateTimeView: BaseView {
    static func create(vm: TaskViewModel) -> BaseView {
        TaskDateTimeView(isBindCall: false).apply {
            $0.backgroundColor = BBColor.paleGrey245.color()
            $0.layer.masksToBounds = true
            $0.vm = vm
            $0.initializeCall()
        }
    }
    
    private var vm: TaskViewModel!
    
    private lazy var vTopArrowGroup = {
        UIView().apply {
            $0.backgroundColor = BBColor.white.color()
        }
    }()
    
    private lazy var ivUpArrow = {
        UIImageView().apply {
            $0.image = BBImage.imgFormOpen.image()
        }
    }()
    
    private lazy var btnDate = {
        UIButton(type: .system).apply {
            $0.setTitle("2023년 11월", for: .normal)
            $0.titleLabel?.font = BBFont.NotoSansKR.bold.font(size: 16)
            $0.tintColor = BBColor.black51.color()
            $0.layer.cornerRadius = 6
        }
    }()
    
    private lazy var btnToday = {
        UIButton(type: .system).apply {
            $0.setTitle("오늘", for: .normal)
            $0.titleLabel?.font = BBFont.NotoSansKR.bold.font(size: 12)
            $0.tintColor = BBColor.deepSkyBlue.color()
        }
    }()
    
    private lazy var vLine = {
        UIView().apply {
            $0.backgroundColor = BBColor.paleGrey235.color()
        }
    }()
    
    private lazy var vWeek = {
        CalendarProxy.loadWeekend()
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
    
    lazy var lblHour = {
        UILabel().apply {
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
            $0.textColor = BBColor.black17.color()
            $0.text = "시"
            $0.textAlignment = .center
        }
    }()
    
    lazy var lblMinute = {
        UILabel().apply {
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
            $0.textColor = BBColor.black17.color()
            $0.text = "분"
            $0.textAlignment = .center
        }
    }()
    
    lazy var ivHourGradient = {
        UIImageView().apply {
            $0.image = BBImage.imgTimeShadow.image()
        }
    }()
    
    lazy var ivMinuteGradient = {
        UIImageView().apply {
            $0.image = BBImage.imgTimeShadow.image()
        }
    }()
    
    lazy var vCollectionHour = {
        UICollectionView(frame: .zero,
                         collectionViewLayout: self.collectionHourFlowLayout).apply {
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = BBColor.clear.color()
            $0.register(TimeViewCell.self, forCellWithReuseIdentifier: "TimeViewCell")
            $0.delegate = self
            $0.dataSource = self
            $0.prefetchDataSource = self
            $0.contentInset = .init(top: 0, left: 22, bottom: 0, right: 9)
         }
    }()
    
    lazy var vCollectionMinute = {
        UICollectionView(frame: .zero,
                         collectionViewLayout: self.collectionMinuteFlowLayout).apply {
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = BBColor.clear.color()
            $0.register(TimeViewCell.self, forCellWithReuseIdentifier: "TimeViewCell")
            $0.delegate = self
            $0.dataSource = self
            $0.prefetchDataSource = self
            $0.contentInset = .init(top: 0, left: 22, bottom: 0, right: 9)
         }
    }()
    
    private lazy var collectionHourFlowLayout = {
        UICollectionViewFlowLayout().apply {
            $0.scrollDirection = .horizontal
        }
    }()
    
    private lazy var collectionMinuteFlowLayout = {
        UICollectionViewFlowLayout().apply {
            $0.scrollDirection = .horizontal
        }
    }()
    
    var selectedHourCell: IndexPath?
    var selectedMinuteCell: IndexPath?
    
    override func bindView() {
        addSubview(btnDate)
        addSubview(btnToday)
        addSubview(vLine)
        addSubview(vWeek.view())
        addSubview(lblSun)
        addSubview(lblMon)
        addSubview(lblTus)
        addSubview(lblWed)
        addSubview(lblThr)
        addSubview(lblFri)
        addSubview(lblSat)
        addSubview(vCollectionHour)
        addSubview(vCollectionMinute)
        addSubview(lblHour)
        addSubview(lblMinute)
        addSubview(ivHourGradient)
        addSubview(ivMinuteGradient)
        addSubview(vTopArrowGroup)
        vTopArrowGroup.addSubview(ivUpArrow)
    }
    
    override func bindEvent() {
        
    }
    
    override func bindCombine() {
        vm.output.resTaskDateTime.sink {
            switch $0 {
            case .SELECTED_RECT(let rect):
                debugPrint(#file, #function, #line)
                self.ivUpArrow.snp.remakeConstraints {
                    $0.left.equalTo(rect.minX + (rect.width / 2) - self.ivUpArrow.width()/2)
                    $0.bottom.equalToSuperview()
                }
                
                UIView.animate(withDuration: 0.3) {
                    self.layoutIfNeeded()
                }
            }
        }.store(in: &cancellable)
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        vTopArrowGroup.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(16)
        }
        
        ivUpArrow.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview().offset(30)
            $0.width.equalTo(18)
            $0.height.equalTo(10)
        }
        
        btnDate.snp.makeConstraints {
            $0.top.equalTo(vTopArrowGroup.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(22)
            $0.height.equalTo(34)
        }
        
        btnToday.snp.makeConstraints {
            $0.top.equalTo(vTopArrowGroup.snp.bottom).offset(20)
            $0.right.equalToSuperview().offset(-22)
            $0.height.equalTo(34)
        }
        
        vLine.snp.makeConstraints {
            $0.top.equalTo(btnDate.snp.bottom).offset(11)
            $0.left.equalToSuperview().offset(22)
            $0.right.equalToSuperview().offset(-22)
            $0.height.equalTo(1)
        }
        
        vWeek.view().snp.makeConstraints {
            $0.top.equalTo(btnDate.snp.bottom).offset(12)
            $0.left.equalToSuperview().offset(9)
            $0.right.equalToSuperview().offset(-9)
            $0.height.equalTo(vWeek.weekendHeight())
        }
        
        lblSun.snp.makeConstraints {
            $0.top.equalTo(vWeek.view().snp.bottom)
            $0.left.equalToSuperview().offset(9)
            $0.height.equalTo(18)
            $0.width.equalTo(lblMon.snp.width)
        }
        
        lblMon.snp.makeConstraints {
            $0.top.equalTo(vWeek.view().snp.bottom)
            $0.left.equalTo(lblSun.snp.right)
            $0.height.equalTo(18)
            $0.width.equalTo(lblTus.snp.width)
        }
        
        lblTus.snp.makeConstraints {
            $0.top.equalTo(vWeek.view().snp.bottom)
            $0.left.equalTo(lblMon.snp.right)
            $0.height.equalTo(18)
            $0.width.equalTo(lblWed.snp.width)
        }
        
        lblWed.snp.makeConstraints {
            $0.top.equalTo(vWeek.view().snp.bottom)
            $0.left.equalTo(lblTus.snp.right)
            $0.height.equalTo(18)
            $0.width.equalTo(lblThr.snp.width)
        }
        
        lblThr.snp.makeConstraints {
            $0.top.equalTo(vWeek.view().snp.bottom)
            $0.left.equalTo(lblWed.snp.right)
            $0.height.equalTo(18)
            $0.width.equalTo(lblFri.snp.width)
        }
        
        lblFri.snp.makeConstraints {
            $0.top.equalTo(vWeek.view().snp.bottom)
            $0.left.equalTo(lblThr.snp.right)
            $0.height.equalTo(18)
            $0.width.equalTo(lblSat.snp.width)
        }
        
        lblSat.snp.makeConstraints {
            $0.top.equalTo(vWeek.view().snp.bottom)
            $0.left.equalTo(lblFri.snp.right)
            $0.right.equalToSuperview().offset(-9)
            $0.height.equalTo(18)
            $0.width.equalTo(lblSun.snp.width)
        }
        
        lblHour.snp.makeConstraints {
            $0.top.equalTo(lblSun.snp.bottom).offset(18)
            $0.left.equalToSuperview().offset(9)
            $0.width.equalTo(51)
            $0.height.equalTo(42)
        }
        
        lblMinute.snp.makeConstraints {
            $0.top.equalTo(lblHour.snp.bottom).offset(12)
            $0.left.equalToSuperview().offset(9)
            $0.bottom.equalToSuperview().offset(-24)
            $0.width.equalTo(51)
            $0.height.equalTo(42)
        }
        
        vCollectionHour.snp.makeConstraints {
            $0.top.equalTo(lblHour.snp.top)
            $0.left.equalTo(lblHour.snp.right)
            $0.right.equalToSuperview()
            $0.bottom.equalTo(lblHour.snp.bottom)
        }
        
        vCollectionMinute.snp.makeConstraints {
            $0.top.equalTo(lblMinute.snp.top)
            $0.left.equalTo(lblMinute.snp.right)
            $0.right.equalToSuperview()
            $0.bottom.equalTo(lblMinute.snp.bottom)
        }
        
        ivHourGradient.snp.makeConstraints {
            $0.top.equalTo(lblHour.snp.top)
            $0.left.equalTo(lblHour.snp.right)
            $0.bottom.equalTo(lblHour.snp.bottom)
            $0.width.equalTo(22)
        }
        
        ivMinuteGradient.snp.makeConstraints {
            $0.top.equalTo(lblMinute.snp.top)
            $0.left.equalTo(lblMinute.snp.right)
            $0.bottom.equalTo(lblMinute.snp.bottom)
            $0.width.equalTo(22)
        }
    }
}

extension TaskDateTimeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == vCollectionHour {
            return 24
        } else {
            return 60
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "TimeViewCell", for: indexPath
        ) as! TimeViewCell

        cell.bindData(data: collectionView == vCollectionHour ? indexPath.row + 1 : indexPath.row)
        
        if collectionView == vCollectionHour,
           selectedHourCell != nil, selectedHourCell!.row == indexPath.row {
            cell.selected()
        } else if collectionView == vCollectionMinute,
                  selectedMinuteCell != nil, selectedMinuteCell!.row == indexPath.row {
            cell.selected()
        } else {
            cell.unSelected()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 60, height: 42)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TimeViewCell else {
            return
        }
        cell.selected()
        
        if collectionView == vCollectionHour {
            selectedHourCell = indexPath
        } else {
            selectedMinuteCell = indexPath
        }
    }
     
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == vCollectionHour, selectedHourCell != nil,
            let cell = collectionView.cellForItem(at: selectedHourCell!) as? TimeViewCell {
            cell.unSelected()
        } else if selectedMinuteCell != nil,
                  let cell = collectionView.cellForItem(at: selectedMinuteCell!) as? TimeViewCell {
            cell.unSelected()
        }
    }
}
