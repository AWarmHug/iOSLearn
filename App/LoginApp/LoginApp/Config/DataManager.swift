//
//  DataManager.swift
//  LoginApp
//
//  Created by Warm-mac on 2018/5/25.
//  Copyright © 2018年 me.warm. All rights reserved.
//

import Foundation
import Alamofire

//typealias successHandler<T> = (T) -> Void
//
//typealias failHandler = (BaseError) -> Void

func loadDataByType(type: Type, page: Int, success: @escaping ([GankNews])->Void, fail: @escaping (BaseError)->Void) {
    let url = baseUrl!.appendingPathComponent("data").appendingPathComponent(type.rawValue).appendingPathComponent(String(pageSize)).appendingPathComponent(String(page));
    Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                if response.error != nil {
                    fail(BaseError(code: 200, message: "出错了"))
                } else {
                    do {
                        let model: BaseModel<GankNews> = try JSONDecoder().decode(BaseModel<GankNews>.self, from: response.data!)
                        if model.error {
                            fail(BaseError(code: 200, message: "出错了"))
                        } else {
                            success(model.results)
                        }
                    } catch {
                        fail(BaseError(code: 200, message: "出错了"))
                    }
                }
            }
}
