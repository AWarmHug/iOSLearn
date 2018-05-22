//
//  Person.swift
//  iOS_UITableView
//
//  Created by Warm-mac on 2018/5/18.
//  Copyright © 2018年 me.warm. All rights reserved.
//

import Foundation

struct Info {

    var name: String!
    var age: Int
    var introduction: String! {
        get {
            return "我叫\(name!),今年\(age)岁了!"
        }
    }


}