//
//  ColorView.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/8/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import BaseFramework
import AssetFramework
import CommonFramework
import LocalizeStringFramework
import Combine

class ColorView: BaseView {
    static func create(vm: ColorViewModel) -> BaseView {
        return ColorView(isBindCall: false).apply {
            $0.backgroundColor = BBColor.white.color()
            $0.vm = vm
            $0.initializeCall()
        }
    }
    
    var vm: ColorViewModel!
    
    private lazy var lblColor = {
        UILabel().apply {
            $0.text = BBString.color
            $0.textColor = BBColor.brownGrey.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
        }
    }()
    
    private lazy var colors = {
        BBPastelColor.allCases.map { color in
            color.color()
        }
    }()
    
    private lazy var vCollection = {
        return UICollectionView(frame: .zero,
                                collectionViewLayout: self.collectionFlowLayout).apply {
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = BBColor.white.color()
            $0.register(ColorViewCell.self, forCellWithReuseIdentifier: "ColorViewCell")
        }
    }()
    
    private lazy var collectionFlowLayout = {
        UICollectionViewFlowLayout().apply {
            $0.scrollDirection = .horizontal
        }
    }()
    
    override func bindView() {
        addSubview(lblColor)
        addSubview(vCollection)
    }
    
    override func bindEvent() {
        vCollection.delegate = self
        vCollection.dataSource = self
        vCollection.prefetchDataSource = self
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        lblColor.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
            $0.height.equalTo(18)
        }
        
        vCollection.snp.makeConstraints {
            $0.top.equalTo(lblColor.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(22)
            $0.right.equalToSuperview().offset(-22)
            $0.height.equalTo(94)
            $0.bottom.equalToSuperview()
        }
    }
}

extension ColorView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        debugPrint(#file, #function, #line, indexPaths)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorViewCell", for: indexPath) as! ColorViewCell
        // 데이터 셋팅
        cell.bindData(data: colors[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        vm.output.res.send(.SELECTED_COLOR(colors[indexPath.row]))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 42, height: 42)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}


