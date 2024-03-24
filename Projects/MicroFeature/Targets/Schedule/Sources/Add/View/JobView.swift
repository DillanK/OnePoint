//
//  JobView.swift
//  ScheduleFramework
//
//  Created by Jin Salon on 3/8/24.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import UIKit
import BaseFramework
import CommonFramework
import AssetFramework
import LocalizeStringFramework
import SnapKit

class JobView: BaseView {
    static func create(vm: JobViewModel) -> BaseView {
        return JobView(isBindCall: false).apply {
            $0.backgroundColor = BBColor.white.color()
            $0.vm = vm
            $0.initializeCall()
//            $0.makeDetailInput(rootView: $0.vInputGroup)
        }
    }
    
    private var vm: JobViewModel!
    
    private lazy var lblJob = {
        UILabel().apply {
            $0.text = BBString.detail
            $0.textColor = BBColor.brownGrey.color()
            $0.font = BBFont.NotoSansKR.regular.font(size: 12)
        }
    }()
    
    private lazy var vInputTable = {
        UITableView().apply {
            $0.register(JobViewCell.self, forCellReuseIdentifier: "JobViewCell")
            $0.separatorStyle = .none
        }
    }()
    
    private lazy var tfInput = {
        UITextField().apply {
            $0.layer.borderColor = BBColor.veryLightPink226.color().cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.placeholder = "세부사항을 입력해주세요."
            $0.setPlaceholderColor(BBColor.veryLightPink187.color())
            $0.addPadding(padding: 10)
        }
    }()

    override func bindView() {
        addSubview(lblJob)
        addSubview(vInputTable)
        addSubview(tfInput)
    }
    
    override func bindEvent() {
        vInputTable.delegate = self
        vInputTable.dataSource = self
        tfInput.delegate = self
    }
    
    override func bindCombine() {
        vm.output.res.sink {
            switch $0 {
            case .RELOAD_TABLE:
                self.reloadConstraint()
                self.vInputTable.reloadData()
                self.vm.output.resScroll.send(.SCROLL_TARGET(self.tfInput))
            }
        }.store(in: &cancellable)
    }
    
    override func bindConstraint(_ isAdjustWindow: Bool) {
        lblJob.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.left.equalToSuperview().offset(26)
            $0.right.equalToSuperview().offset(-26)
            $0.height.equalTo(18)
        }
        
        vInputTable.snp.makeConstraints {
            $0.top.equalTo(lblJob.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(22)
            $0.right.equalToSuperview().offset(-22)
            $0.height.equalTo(0)
        }
        
        tfInput.snp.makeConstraints {
            $0.top.equalTo(vInputTable.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(22)
            $0.right.equalToSuperview().offset(-22)
            $0.height.equalTo(42)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func reloadConstraint() {
        let count = self.vm.jobs.count
        vInputTable.snp.remakeConstraints {
            $0.top.equalTo(lblJob.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(22)
            $0.right.equalToSuperview().offset(-22)
            $0.height.equalTo(count * 46)
        }
        
        if count > 0 {
            tfInput.snp.remakeConstraints {
                $0.top.equalTo(vInputTable.snp.bottom).offset(0)
                $0.left.equalToSuperview().offset(22)
                $0.right.equalToSuperview().offset(-22)
                $0.height.equalTo(42)
                $0.bottom.equalToSuperview()
            }
        } else {
            tfInput.snp.remakeConstraints {
                $0.top.equalTo(vInputTable.snp.bottom).offset(4)
                $0.left.equalToSuperview().offset(22)
                $0.right.equalToSuperview().offset(-22)
                $0.height.equalTo(42)
                $0.bottom.equalToSuperview()
            }
        }
        
        self.superview?.layoutIfNeeded()
    }
}

extension JobView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "JobViewCell", for: indexPath
        ) as! JobViewCell
        
        cell.bindData(data: vm.jobs[indexPath.row])
        
        return cell
    }
}

extension JobView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        vm.output.resScroll.send(.SCROLL_TARGET(tfInput))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == nil, textField.text!.count == 0 {
            return false
        }
        vm.input.req.send(.AddJob(textField.text!))
        textField.text = ""
        return true
    }
}
