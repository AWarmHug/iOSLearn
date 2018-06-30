//
//  MainViewController.swift
//  LoginApp
//
//  Created by Warm-mac on 2018/5/21.
//  Copyright © 2018年 me.warm. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var utv: UITableView!

    var gankModel: BaseModel<GankNews> = {
        var news = [GankNews]()

        for index in 0..<20 {
            var new = GankNews(_id: String(index), createdAt: "2018-4-1\(index)", desc: "这是第\(index)篇文章", images: nil, publishedAt: "2018-5-1\(index)", source: "chrome", type: "Android", url: "https://github.com/signalapp/Signal-Android", used: true, who: "张三\(index)")
            news.insert(new, at: index)
        }

        let gankModel: BaseModel<GankNews> = BaseModel<GankNews>(error: false, results: news)
        return gankModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        utv.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        getData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getData() {
        //http://gank.io/api/data/Android/10/1
//        var url = baseUrl!.appendingPathComponent("data").appendingPathComponent("Android").appendingPathComponent("10").appendingPathComponent("1");
//        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
//                .response
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gankModel.results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as UITableViewCell
        cell.textLabel!.text = gankModel.results[indexPath.row].desc
        return cell
    }

}
