//
//  MineViewController.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/4.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit
import SnapKit

class MineViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    lazy var models: [UserLogin] = {
        var users = [UserLogin]()
        for i in 0..<100 {
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

    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
//        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.itemSize = CGSize(width: ((UIScreen.main.bounds.width - 40) / 3), height: 146)
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.white
        collection.dataSource = self
        collection.delegate = self
        collection.autoresizingMask = UIViewAutoresizing.flexibleHeight
        collection.ex_registerCell(type: MineCollectionViewCell.self)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collection)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.ex_dequeueCell(type: MineCollectionViewCell.self, indexPath: indexPath)
        cell.userLogin = models[indexPath.row]
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
