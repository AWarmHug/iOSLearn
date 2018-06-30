//
//  Config.swift
//  LoginApp
//
//  Created by Warm-mac on 2018/5/24.
//  Copyright © 2018年 me.warm. All rights reserved.
//

import Foundation

//http://gank.io/api/data/Android/10/1

public var baseUrl = URL(string: "http://gank.io/api/")

public var pageSize = 10

public enum Type: String {
    case Android = "Android"
    case iOS = "iOS"
}

