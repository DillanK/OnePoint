//
//  FeatureProxy.swift
//  FeatureLib
//
//  Created by hyunjin on 2023/10/24.
//  Copyright © 2023 Beakbig. All rights reserved.
//

import UIKit

public class FeatureProxy {
    public static func loadSampleViewController() -> UIViewController {
        return SampleViewController.create()
    }
    
    public static func laodHomeViewController() -> UIViewController {
        return HomeViewController.create()
    }
}
