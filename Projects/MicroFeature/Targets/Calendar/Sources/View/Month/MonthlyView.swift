//
//  MonthView.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/23.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit
import SnapKit
import AssetFramework
import BaseFramework

class MonthlyView: BaseView, MonthlyProxy {
    static func create() -> MonthlyView {
        return MonthlyView(isBindCall: false).apply {
            $0.initializeCall()
            LocalCalendarManger.shared.loadMonthly()
            $0.backgroundColor = .green
        }
    }
    
    lazy var vCollection = {
        return UICollectionView(frame: .zero,
                                collectionViewLayout: self.collectionFlowLayout).apply {
            $0.backgroundColor = UIColor.white
            $0.showsHorizontalScrollIndicator = false
            $0.register(MonthViewCell.self, forCellWithReuseIdentifier: "MonthViewCell")
            $0.register(MonthTitleViewCell.self, forCellWithReuseIdentifier: "MonthTitleViewCell")
        }
    }()
    
    private lazy var collectionFlowLayout = {
        UICollectionViewFlowLayout().apply {
            $0.scrollDirection = .vertical
        }
    }()
    
    lazy var viewModel = {
        CalendarViewModel(cancellable)
    }()
    
    // 주간 데이터
    var weekDays = Array<(String, DailyModel)>()
    var cellSize: CGSize = .zero
    var reScrolling: (Bool, CGFloat, CGFloat) = (false, 0, 0)
    
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
                let index = self.todayIndex()
                self.reloadData(index: index.0, monthCount: index.1)
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
            self.reloadData(index: CGFloat(currentIndex.row))
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        debugPrint(#function, #line, self.frame)
        cellSize = .init(width: (self.width() - 14) / 7, height: (self.width() - 14) / 7)
        if reScrolling.0 {
            reloadData(index: reScrolling.1, monthCount: reScrolling.2)
        }
    }
}

extension MonthlyView {
    func view() -> UIView {
        return self
    }
}

extension MonthlyView {
    /// 현재 일자의 위치를 계산한다.
    /// - Returns: 데이터에서 현재 일자의 위치 값을 반환한다.
    private func todayIndex() -> (CGFloat, CGFloat) {
        let firstDay = Date().string(format: "yyyy0201")
        debugPrint(#file, #function, #line, "firstDay: \(firstDay)")
        var monthCount: CGFloat = 0
        let index: CGFloat = CGFloat(LocalCalendarManger.shared.monthlyData.firstIndex { value in
            if value.1 as? MonthlyModel != nil {
                monthCount += 1
            }
            return value.0 == firstDay
        } ?? 0)
        return (index, monthCount)
    }
    
    /// 주간 Cell UI를 다시 불러온다.
    /// - Parameter index: 주간 데이터의 시작 위치
    private func reloadData(index: CGFloat, monthCount: CGFloat = 0) {
        debugPrint(#file, #function, #line, "Index : \(index), monthCount : \(monthCount)")
        guard cellSize.height > 0 else {
            reScrolling = (true, index, monthCount)
            return
        }
        reScrolling = (false, 0, 0)
            
        var y: CGFloat = ((index - monthCount)/7 + (monthCount - 2)) * cellSize.height
        y = y - (self.height() / cellSize.height)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.vCollection.reloadData()
            self.vCollection.setContentOffset(.init(x: 0, y: y), animated: false)
        }
    }
}

extension MonthlyView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        debugPrint(#file, #function, #line, indexPaths)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LocalCalendarManger.shared.monthlyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = LocalCalendarManger.shared.monthlyData[indexPath.row].1 as? MonthlyModel != nil ? "MonthTitleViewCell" : "MonthViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! BaseCollectionViewCell<CalendarModelProtocol>
        cell.bindData(data: LocalCalendarManger.shared.monthlyData[indexPath.row].1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        debugPrint(#file, #function, #line)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if LocalCalendarManger.shared.monthlyData[indexPath.row].1 as? MonthlyModel != nil {
            return .init(width: self.width(), height: cellSize.height)
        }
        
//        let size = (self.width() - 14) / 7
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
