//
//  MainViewController.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/4.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {


    lazy var button: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("点我跳转", for: .normal)
        button.addTarget(self, action: #selector(pushDetail(sender:)), for: .touchUpInside)
        return button
    }()

    lazy var button2: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("点我跳转传值", for: .normal)
        button.addTarget(self, action: #selector(pushDetail2), for: .touchUpInside)
        return button
    }()

    @objc func pushDetail2(sender: UIButton) {
        let vc = HomeDetailViewController()
        vc.msg = "哈哈哈"
        push(vc)
    }

    @objc func pushDetail(sender: UIButton) {
        let vc = HomeDetailViewController()
        push(vc)
    }

    lazy var notiBt: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("点我切换页面", for: .normal)
        button.addTarget(self, action: #selector(noti(sender:)), for: .touchUpInside)
        return button
    }()


    @objc func noti(sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("test"), object: self, userInfo: ["post": 1])
    }

    lazy var animBt: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("动画", for: .normal)
        button.addTarget(self, action: #selector(anim(sender:)), for: .touchUpInside)
        return button
    }()


    @objc func anim(sender: UIButton) {
        push(AnimationViewController())
    }

    lazy var gestureBt: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("手势", for: .normal)
        button.addTarget(self, action: #selector(gesture(sender:)), for: .touchUpInside)
        return button
    }()


    @objc func gesture(sender: UIButton) {
        push(GestureViewController())
    }

    lazy var coreDataBt: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("CoreData", for: .normal)
        button.addTarget(self, action: #selector(coreData(sender:)), for: .touchUpInside)
        return button
    }()


    @objc func coreData(sender: UIButton) {
        push(UIStoryboard(name: "CoreDataViewController", bundle: nil).instantiateViewController(withIdentifier: "CoreDataViewController"))
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(button2)
        view.addSubview(notiBt)
        view.addSubview(animBt)
        view.addSubview(gestureBt)
        view.addSubview(coreDataBt)
        button.snp.makeConstraints { maker in
            maker.width.equalTo(view)
            maker.top.equalTo(view)
        }
        button2.snp.makeConstraints { maker in
            maker.width.height.equalTo(button)
            maker.top.equalTo(button.snp.bottom)
        }
        notiBt.snp.makeConstraints { maker in
            maker.width.height.equalTo(button)
            maker.top.equalTo(button2.snp.bottom)
        }
        animBt.snp.makeConstraints { maker in
            maker.width.height.equalTo(button)
            maker.top.equalTo(notiBt.snp.bottom)
        }
        gestureBt.snp.makeConstraints { maker in
            maker.width.height.equalTo(button)
            maker.top.equalTo(animBt.snp.bottom)
        }
        coreDataBt.snp.makeConstraints { maker in
            maker.width.height.equalTo(button)
            maker.top.equalTo(gestureBt.snp.bottom)
         }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
