//
//  ScheduleListView.swift
//  FeatureFamework
//
//  Created by hyunjin on 2023/11/14.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit
import SnapKit
import AssetFramework
import BaseFramework
import AssetFramework
import CommonFramework

class ScheduleListView: BaseView {
    
    static func create() -> ScheduleListView {
        return ScheduleListView().apply {
            $0.backgroundColor = BBColor.white.color()
//            BBColors.allCases
        }
    }
    
    let SCHEDULE_SAMPLE_DATA: [ScheduleModel] = [
        .init(dailyInfo: .init(year: 2024, month: 1, day: 1, weekend: 1),
              symboleColor: BBPastelColor.veryLightBlue.color(),
              startTime: 0,
              endTime: 60,
              betweenTime: 60,
              title: "메가폰"),
        .init(dailyInfo: .init(year: 2024, month: 1, day: 1, weekend: 1),
              symboleColor: BBPastelColor.cb1D3C5.color(),
              startTime: 120,
              endTime: 180,
              betweenTime: 60,
              title: "플래그"),
        .init(dailyInfo: .init(year: 2024, month: 1, day: 1, weekend: 1),
              symboleColor: BBPastelColor.c4D80E4.color(),
              startTime: 180,
              endTime: 240,
              betweenTime: 60,
              title: "기어",
              jobs: [
                .init(title: "1단 기어", isCompleted: false),
                .init(title: "2단 기어", isCompleted: false)
              ]),
        .init(dailyInfo: .init(year: 2024, month: 1, day: 1, weekend: 1),
              symboleColor: BBPastelColor.eggShell.color(),
              startTime: 0,
              endTime: 60,
              betweenTime: 60,
              title: "메가폰"),
        .init(dailyInfo: .init(year: 2024, month: 1, day: 1, weekend: 1),
              symboleColor: BBPastelColor.pale.color(),
              startTime: 120,
              endTime: 180,
              betweenTime: 60,
              title: "플래그"),
        .init(dailyInfo: .init(year: 2024, month: 1, day: 1, weekend: 1),
              symboleColor: BBPastelColor.veryLightGreen.color(),
              startTime: 180,
              endTime: 240,
              betweenTime: 60,
              title: "기어",
              jobs: [
                .init(title: "1단 기어", isCompleted: false),
                .init(title: "2단 기어", isCompleted: false)
              ]),
        .init(dailyInfo: .init(year: 2024, month: 1, day: 1, weekend: 1),
              symboleColor: BBPastelColor.paleLavender.color(),
              startTime: 0,
              endTime: 60,
              betweenTime: 60,
              title: "메가폰"),
        .init(dailyInfo: .init(year: 2024, month: 1, day: 1, weekend: 1),
              symboleColor: BBPastelColor.veryLightBlue.color(),
              startTime: 120,
              endTime: 180,
              betweenTime: 60,
              title: "플래그"),
        .init(dailyInfo: .init(year: 2024, month: 1, day: 1, weekend: 1),
              symboleColor: BBPastelColor.lightPeriwinkle.color(),
              startTime: 180,
              endTime: 240,
              betweenTime: 60,
              title: "기어",
              jobs: [
                .init(title: "1단 기어", isCompleted: false),
                .init(title: "2단 기어", isCompleted: false)
              ])
    ]
    
    lazy var tbList = {
        UITableView().apply {
            $0.backgroundColor = BBColor.white.color()
            $0.separatorStyle = .none
            $0.register(ScheduleListViewCell.self, forCellReuseIdentifier: "ScheduleListViewCell")
        }
    }()
    
    override func bindView() {
        addSubview(tbList)
    }
    
    override func bindEvent() {
        tbList.delegate = self
        tbList.dataSource = self
    }
    
    override func bindCombine() {
        
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        tbList.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ScheduleListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SCHEDULE_SAMPLE_DATA.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleListViewCell", for: indexPath) as! ScheduleListViewCell
        cell.bindData(data: SCHEDULE_SAMPLE_DATA[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ScheduleListViewCell.calculatorHeight(model: SCHEDULE_SAMPLE_DATA[indexPath.row])
    }
}
