//
//  ShareModel.swift
//  FeatureFamework
//
//  Created by hyunjin on 2024/01/11.
//  Copyright © 2024 Beakbig. All rights reserved.
//

import Foundation

public struct ShareModel: CustomStringConvertible {
    public var description: String {
        return "ShareModel Value(" +
        "                id: \(id)," +
        "                Name: \(name)," +
        "                thumbnail: \(thumbnail))"
    }
    /// 사용자 구분 ID
    public let id: String
    /// 이름
    public let name: String
    /// 썸네일 이미지
    public let thumbnail: String
    /// 참석 여부
    public let isAttend: Bool
    
    public init(id: String, name: String, thumbnail: String, isAttend: Bool) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.isAttend = isAttend
    }
}
