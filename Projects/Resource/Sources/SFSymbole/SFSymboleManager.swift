//
//  SFSymboleManager.swift
//  Structed
//
//  Created by hyunjin on 2023/10/04.
//

import Foundation

public class SFSymboleManager {
    public static let shared = SFSymboleManager()
    
    private var symboles: [String : [String]]
    // 생성 후 바로 검색 시 데이터 생성 후 검색 되도록 제약 거는 부분
    private let semaphore = DispatchSemaphore(value: 1)
    
    private init(symboles: [String : [String]] = [String : [String]]()) {
        self.symboles = symboles
        loadSymbole()
    }
    
    private func loadSymbole() {
        semaphore.wait()
//        DispatchQueue.global().async {
//            for symbole in BBSymbole.allCases {
//                guard let loadValue = symbole.loadToArray() else {
//                    continue
//                }
//                self.symboles[symbole.rawValue] = loadValue
//            }
//            debugPrint("Symbole Load Complete : \(BBSymbole.allCases.count)")
//            debugPrint("Symbole Load Complete : \(self.symboles.count)")
//            self.semaphore.signal()
//        }
    }
    
    private func searchInsideSymbole(key: String, search value: String) -> [String] {
        guard let values = symboles[key] else {
            return []
        }
        
        return values.filter { symbole in
            symbole.contains(value)
        }
    }
}

extension SFSymboleManager {
    public func searchSymbole(search value: String, block: @escaping ([String]) -> ()) {
        semaphore.wait()
        DispatchQueue.global().async {
            debugPrint("Search Start Time : \(Date.now)")
            var searchValue = [String]()
            self.symboles.keys.forEach { key in
                searchValue.append(contentsOf: self.searchInsideSymbole(key: key, search: value))
            }
            
            debugPrint("Search Start Time : \(Date.now)")
            block(Array(Set(searchValue)))
            self.semaphore.signal()
        }
    }
}
