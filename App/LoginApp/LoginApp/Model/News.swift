//
//  News.swift
//  LoginApp
//
//  Created by Warm-mac on 2018/5/22.
//  Copyright © 2018年 me.warm. All rights reserved.
//

import Foundation

struct BaseModel<T> {
    var error: Bool = false
    var results: [T] = [T]()
}

/**
 *{
"_id": "5af6603b421aa97cc3314838",
"createdAt": "2018-05-12T11:32:11.176Z",
"desc": "基于ijkPlayer的Android视频播放器",
"images": [
"http://img.gank.io/f1b0bce1-1089-492b-a529-19f5a2072a71",
"http://img.gank.io/5e4971ff-9797-41f9-b04f-1771622fb703",
"http://img.gank.io/4ff1c53c-d15b-4a36-961f-01c1ac256265",
"http://img.gank.io/4d7708c5-a795-47da-9bb2-7e17fe21667c"
],
"publishedAt": "2018-05-21T01:11:33.975Z",
"source": "web",
"type": "Android",
"url": "https://github.com/hpdx/XPlayer2",
"used": true,
"who": "android_ls"
}
 */
struct GankNews {
    var _id: String!
    var createdAt: String!
    var desc: String!
    var images: [String]?
    var publishedAt: String!
    var source: String?
    var type: String?
    var url: String?
    var used: Bool = false
    var who: String?
}