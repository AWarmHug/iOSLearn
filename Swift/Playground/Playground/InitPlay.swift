//
//  InitPlay.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/4.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import Foundation

class XClass {
    var name:String?
    var address:String?

}


struct Student {
    var xClass: XClass?
    let id: Int
    var name: String!
    var age: Int!

    init(xclass: XClass = XClass(), id: Int = 0, name: String, age: Int) {
        self.xClass = xclass
        self.id = id
        self.name = "张三"
        self.age = age
    }

}