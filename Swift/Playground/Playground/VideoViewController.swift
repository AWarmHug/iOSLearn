//
//  VideoViewController.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/4.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit
import SnapKit

class VideoViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    lazy var models: [UserLogin] = {
        var users = [UserLogin]()
        for i in 0..<30 {
            var sign: String
            var login = true
            switch i % 5 {
            case 0:
                sign = "这是我的签名\(i)"
                login = false
            case 1:
                sign = "这是我的签名这是我的签名这是我的签名这是我的签名这是我的签名这是我的签名签名这是我的签名这是我的签名签名这是我的签名这是我的签名\(i)"
                login = false
            case 2:
                sign = "这是我的签名这是我的签名这是我的签名这是我的签名这是我的签名这是我的签名这是我的签名这是我的签名这是我的签名\(i)"
                login = false
            case 3:
                sign = "这这是我的签名这是我的签名这是我的签名\(i)"
                login = true
            case 4:
                sign = "这是我\(i)"
                login = true
            default:
                sign = "这是我\(i)"
                login = false
            }
            let user = UserLogin(headerImg: "ssss", name: "张三\(i)", sign: sign, login: login)
            users.append(user)
        }
        return users
    }()


    lazy var tabel: UITableView = {
        let tabel = UITableView()
        tabel.backgroundColor = UIColor.brown
        tabel.delegate = self
        tabel.dataSource = self
        //这两行不设置也是可以实现的
        tabel.estimatedRowHeight = 80
        tabel.rowHeight = UITableViewAutomaticDimension
        tabel.ex_registerCell(type: VideoTableViewCell.self)
        return tabel
    }()

    lazy var add: UIButton = {
        let bt = UIButton()
        bt.setTitle("添加", for: .normal)
        bt.setTitleColor(UIColor.black, for: .normal)
        bt.addTarget(self, action: #selector(addItems), for: .touchUpInside)
        return bt
    }()

    @objc func addItems() {
        let row = models.count
        models.insert(contentsOf: models, at: models.count)
        var indexPaths = [IndexPath]()
        for i in row..<models.count {
            indexPaths.append(IndexPath(row: i, section: 0))
        }
        tabel.insertRows(at: indexPaths, with: .left)
    }

    lazy var remove: UIButton = {
        let bt = UIButton()
        bt.setTitle("移除", for: .normal)
        bt.setTitleColor(UIColor.black, for: .normal)
        bt.addTarget(self, action: #selector(removeItems), for: .touchUpInside)
        return bt
    }()

    @objc func removeItems() {
        var indexPaths = [IndexPath]()
        let count = models.count
        let row = 10
        for i in 0..<row {
            models.removeLast()
            indexPaths.append(IndexPath(row: count - i - 1, section: 0))
        }
        tabel.deleteRows(at: indexPaths, with: .left)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabel)
        let btsView = UIView()
        view.addSubview(btsView)
        btsView.addSubview(add)
        btsView.addSubview(remove)

        btsView.snp.makeConstraints { (maker) in
            maker.width.equalTo(view)
            maker.height.equalTo(40)
            maker.left.bottom.equalTo(view)
        }

        add.snp.makeConstraints { (maker) in
            maker.height.equalTo(btsView)
            maker.left.equalTo(btsView)
            maker.top.equalTo(btsView)
        }
        remove.snp.makeConstraints { (maker) in
            maker.height.equalTo(btsView)
            maker.left.equalTo(add.snp.right)
            maker.top.equalTo(btsView)
        }

        tabel.snp.makeConstraints { (maker) in
            maker.width.equalTo(view)
            maker.top.equalTo(view)
            maker.bottom.equalTo(btsView.snp.top)
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ex_dequeueCell(type: VideoTableViewCell.self, indexPath: indexPath)
        cell.name.text = models[indexPath.row].name
        cell.sign.text = models[indexPath.row].sign
        cell.login.text = models[indexPath.row].login ? "在线中" : "已下线"
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        push(PlistViewController())
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


}


