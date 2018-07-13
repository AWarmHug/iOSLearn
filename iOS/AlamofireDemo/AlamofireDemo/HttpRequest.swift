//
//  HttpRequest.swift
//  AlamofireDemo
//
//  Created by Warm-mac on 2018/7/2.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import Foundation
import Alamofire

public var baseUrl = URL(string: "http://gank.io/api/")!

public var pageSize = 10

public enum Type: String {
    case Android = "Android"
    case iOS = "iOS"
}


class HttpRequset {
    static let INSTANCE = HttpRequset()

    private init() {
    }
}


extension HttpRequset {

    typealias SuccessHandler<T: Codable> = (BaseModel<T>) -> Void
    typealias FailHander = (BaseError) -> Void

    func get<T: Codable>(url: String, params: [String: Any], sucess: @escaping SuccessHandler<T>, fail: @escaping FailHander) {

        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil)
                .responseJSON { (response) in
                    self.handleResponse(response, fail: fail, sucess: {
                        let t: BaseModel<T> = try JSONDecoder().decode(BaseModel<T>.self, from: response.data!)
                        if t.error {
                            fail(BaseError(code: 501, message: "请求出错"))
                        } else {
                            sucess(t)
                        }
                    })
                }
    }

    func post<T: Codable>(url: String, params: [String: Any], success: @escaping (T) -> Void, fail: @escaping (BaseError) -> Void) {
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil)
                .responseJSON { (response) in
                    self.handleResponse(response, fail: fail, sucess: {
                        let t: Base51Model<T> = try JSONDecoder().decode(Base51Model<T>.self, from: response.data!)
                        if t.status != 200 {
                            fail(BaseError(code: t.status, message: t.message))
                        } else {
                            success(t.data!)
                        }
                    })
                }
    }


    func handleResponse(_ response: DataResponse<Any>, fail: @escaping FailHander, sucess: @escaping () throws -> Void) {
        if response.error != nil {
            fail(BaseError.HTTP_ERROR)
        } else {
            do {
                try sucess();
            } catch {
                fail(BaseError.CODE_ERROR)
            }
        }
    }

    func download(url: String, progress: @escaping Request.ProgressHandler, completion: @escaping (DownloadResponse<Data>) -> Void) -> DownloadRequest {


        let destination: DownloadRequest.DownloadFileDestination = { temporaryURL, response in
            let directoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            if !directoryURLs.isEmpty {
                let name = String(Int(Date().timeIntervalSince1970)) + response.suggestedFilename!;
                return (directoryURLs[0].appendingPathComponent(name), [])
            }
            return (temporaryURL, [])
        }


        let request = Alamofire.download(url, method: .get, parameters: nil, encoding: JSONEncoding.default, to: destination)
        request.downloadProgress(closure: progress)
                .validate { request, response, temporaryURL, destinationURL in
                    return .success
                }
                .responseData(completionHandler: completion)
        request.resume()
        return request
    }

    func pause() {
        Alamofire.pause()
    }

    func resume(request: Request) {
        request.resume()
    }
}






