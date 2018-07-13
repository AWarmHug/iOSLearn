//
//  Model.swift
//  AlamofireDemo
//
//  Created by Warm-mac on 2018/7/2.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import Foundation

public struct BaseError :Error{
    var code:Int=0
    var message:String?
}

extension BaseError{
    static let HTTP_ERROR =  BaseError(code: 401, message: "请求出错")
    static let CODE_ERROR = BaseError(code: 500, message: "解析出错")
}


struct BaseModel<T>: Codable where T: Codable {
    var error: Bool = false
    var results:T?
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
struct GankNews: Codable {
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

struct Base51Model<T>: Codable where T:Codable{
    var status = 0
    var message="ok"
    var data:T?
}

struct Version: Codable {
    
    var id :Int?
    var version : String?
    var vno:String?
    var date : String?
    var text : String?
    var update : String?
    var url : String?
    
    enum CodingKeys:String,CodingKey {
        case id
        case version = "sv_version"
        case vno = "sv_vno"
        case date = "sv_date"
        case text = "sv_text"
        case update = "sv_update"
        case url = "sv_url"
    }
    
}
