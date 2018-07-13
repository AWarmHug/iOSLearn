//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by Warm-mac on 2018/7/2.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {

    var url: String = "http://i1.umei.cc/uploads/tu/201807/9999/02a26ad6f7.jpg"
    var request: Request?

    lazy var get: UIButton = {
        let bt = UIButton()
        bt.setTitle("Get请求", for: UIControlState.normal)
        bt.backgroundColor = UIColor.brown
        bt.addTarget(self, action: #selector(doGetRequest(sender:)), for: UIControlEvents.touchUpInside)
        return bt
    }()

    @objc func doGetRequest(sender: UIButton) {
        HttpRequset.INSTANCE.get(url: "http://gank.io/api/data/Android/10/1", params: [:], sucess: { (model: BaseModel<[GankNews]>) in
            let date = try! JSONEncoder().encode(model)
            self.result.text = String(data: date, encoding: String.Encoding.utf8)
        }) { (error) in
            self.result.text = error.message
        }
    }

    lazy var post: UIButton = {
        let bt = UIButton()
        bt.setTitle("Post请求", for: UIControlState.normal)
        bt.backgroundColor = UIColor.brown
        bt.addTarget(self, action: #selector(doPostRequest(sender:)), for: UIControlEvents.touchUpInside)
        return bt
    }()

    @objc func doPostRequest(sender: UIButton) {
        HttpRequset.INSTANCE.post(url: "http://api.51hs.cn/2/backend/web/index.php?r=file/get-system-version", params: ["ak": "IXuNz/MuG7VUJJ1Eg4octg==", "sn": "LH64XOW479lm+bO4c85MEQg+frUYeC4oaEAnnSBsQlc=", "name": "drink"], success: { (version: Version) in
            self.url=version.url!
            let date = try! JSONEncoder().encode(version)
            self.result.text = String(data: date, encoding: String.Encoding.utf8)
        }) { (error) in
            self.result.text = error.message
        }
        HttpRequset.INSTANCE.post(url: "http://api.51hs.cn/2/backend/web/index.php?r=file/get-system-version", params:
        ["ak": "IXuNz/MuG7VUJJ1Eg4octg==", "sn": "LH64XOW479lm+bO4c85MEQg+frUYeC4oaEAnnSBsQlc=", "name": "drink"], success: { (version: Version) in

        }, fail: { error in

        })
    }

    lazy var download: UIButton = {
        let bt = UIButton()
        bt.setTitle("下载", for: UIControlState.normal)
        bt.backgroundColor = UIColor.brown
        bt.addTarget(self, action: #selector(download(sender:)), for: UIControlEvents.touchUpInside)
        return bt
    }()

    @objc func download(sender: UIButton) {
        if self.request == nil {
            request = HttpRequset.INSTANCE
                    .download(url: self.url, progress: { progress in
                if progress.isPaused {
                    self.result.text = "暂停中"
                } else {
                    self.result.text = "\(progress.completedUnitCount * 100 / progress.totalUnitCount)%"
                }
            }) { (response) in
                if response.result.isSuccess {
                    self.result.text = "下载成功"
                    self.request=nil
                } else {
                    self.result.text = "下载失败\(response.error!.localizedDescription)"
                }
            }
        } else {
            HttpRequset.INSTANCE.resume(request: request!)
        }
    }

    lazy var pause: UIButton = {
        let bt = UIButton()
        bt.setTitle("暂停", for: UIControlState.normal)
        bt.backgroundColor = UIColor.brown
        bt.addTarget(self, action: #selector(pause(sender:)), for: UIControlEvents.touchUpInside)
        return bt
    }()

    @objc func pause(sender: UIButton) {
        HttpRequset.INSTANCE.pause()
    }


    lazy var result: UILabel = {
        let label = UILabel();
        label.textColor = UIColor.black
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(get)
        view.addSubview(post)
        view.addSubview(result)
        view.addSubview(download)
        view.addSubview(pause)
        get.snp.makeConstraints { (make) in
            make.width.equalTo(view).multipliedBy(0.3)
            make.height.equalTo(48)
            make.left.top.equalTo(view)
        }
        post.snp.makeConstraints { (make) in
            make.width.height.equalTo(get)
            make.left.equalTo(get.snp.right)
        }
        download.snp.makeConstraints { (make) in
            make.width.height.equalTo(get)
            make.left.equalTo(get.snp.left)
            make.top.equalTo(get.snp.bottom)
        }
        pause.snp.makeConstraints { maker in
            maker.width.height.equalTo(download)
            maker.left.equalTo(download.snp.right)
            maker.top.equalTo(download)
        }

        result.snp.makeConstraints { (make) in
            make.width.equalTo(view)
            make.left.equalTo(view)
            make.top.equalTo(download.snp.bottom)
        }
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

