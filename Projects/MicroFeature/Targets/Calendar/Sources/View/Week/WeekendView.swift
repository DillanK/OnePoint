//
//  WeekendView.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/23.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit
import CoreFramework
import Combine
import AssetFramework
import BaseFramework

/*
 --- --- --- --- --- --- ---
  1   2   3   4   5   6   7
 --- --- --- --- --- --- ---  >
  S   M   T   W   T   F   S
 --- --- --- --- --- --- ---
 */

class WeekendView: BaseView, WeekendProxy {
    static func create() -> WeekendView {
        return WeekendView(isBindCall: false).apply {
            $0.initializeCall()
            LocalCalendarManger.shared.loadMonthly()
            $0.backgroundColor = .clear
        }
    }
    
    private lazy var vCollection = {
        return UICollectionView(frame: .zero,
                                collectionViewLayout: self.collectionFlowLayout).apply {
            $0.backgroundColor = BBColor.clear.color()
            $0.showsHorizontalScrollIndicator = false
            $0.isPagingEnabled = true
            $0.register(WeekendViewCell.self, forCellWithReuseIdentifier: "WeekendViewCell")
        }
    }()
    
    private lazy var collectionFlowLayout = {
        UICollectionViewFlowLayout().apply {
            $0.scrollDirection = .horizontal
        }
    }()
    
    lazy var viewModel = {
        CalendarViewModel(cancellable)
    }()
    
    var selectedWeek: IndexPath?
    
    override func bindView() {
        addSubview(vCollection)
    }
    
    override func bindEvent() {
        vCollection.delegate = self
        vCollection.dataSource = self
        vCollection.prefetchDataSource = self
    }
    
    override func bindCombine() {
        LocalCalendarManger.shared.response.sink { result in
            switch result {
            case .finished:
                debugPrint("finish")
            case .failure(let error):
                debugPrint("Error : \(error.localizedDescription)")
            }
        } receiveValue: { type in
            switch type {
            case .LOAD_MONTHLY_DATA:
                debugPrint(#file, #function, #line, type)
                self.reloadData(index: self.todayIndex())
            case .ADD_DAYILY_DATA:
                debugPrint(#file, #function, #line, type)
            }
        }.store(in: &cancellable)
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        vCollection.snp.makeConstraints {
            $0.edges.equalToSuperview()            
        }
        
        if isAdjustWindow, 
            let currentIndex = self.vCollection.indexPathForItem(
                at: self.vCollection.contentOffset
            ) {
            self.reloadData(index: currentIndex.row + 1)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        debugPrint(#function, #line, self.frame)
    }
}

extension WeekendView {
    func view() -> UIView {
        return self
    }
    
    func weekendHeight() -> CGFloat {
        return (windowBounds().width / 375) * 45
    }
}

extension WeekendView {
    /// 현재 일자의 위치를 계산한다.
    /// - Returns: 데이터에서 현재 일자의 위치 값을 반환한다.
    private func todayIndex() -> Int {
        let startDayToWeek = Date().startOfWeek().string()
        var emptyCount = 0
        let index = LocalCalendarManger.shared.monthlyData.firstIndex { value in
            if value.1 as? DailyEmptyModel != nil {
                emptyCount += 1
            }
            return value.0 == startDayToWeek
        } ?? 0
        return 0//(index > 0) ? index - emptyCount : index
    }
    
    /// 주간 Cell UI를 다시 불러온다.
    /// - Parameter index: 주간 데이터의 시작 위치
    private func reloadData(index: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.vCollection.reloadData()
            self.vCollection.setContentOffset(
                .init(x: CGFloat(index / 7) * self.width(),
                      y: 0),
                animated: false)
        }
    }
}


extension WeekendView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        debugPrint(#file, #function, #line, indexPaths)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LocalCalendarManger.shared.monthlyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeekendViewCell", for: indexPath) as! WeekendViewCell
        if let model = LocalCalendarManger.shared.monthlyData[indexPath.row].1 as? DailyModel {
            cell.bindData(data: model)
        }

        if selectedWeek != nil, selectedWeek!.row == indexPath.row {
            cell.selected()
        } else {
            cell.unSelected()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if LocalCalendarManger.shared.monthlyData[indexPath.row].1 as? DailyModel != nil {
            
            return .init(width: (self.width() - 7) / 7, height: self.weekendHeight())
        } else {
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint(#file, #function, #line)
        guard let cell = collectionView.cellForItem(at: indexPath) as? WeekendViewCell else {
            return
        }
        
        cell.selected()
        
        selectedWeek = indexPath
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        debugPrint(#file, #function, #line)
        
        guard selectedWeek != nil,
              let cell = collectionView.cellForItem(at: selectedWeek!) as? WeekendViewCell else {
            return
        }
        
        cell.unSelected()
    }
}
