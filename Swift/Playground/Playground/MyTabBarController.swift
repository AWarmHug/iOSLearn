//
//  MyTabBarController.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/4.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 1
        tabBar.tintColor = UIColor(named: "color")
        setAllChild()
        NotificationCenter.default.addObserver(self, selector: #selector(notiChange(noti:)), name: Notification.Name("test"), object: nil)
    }


    func setAllChild() {
        setChildViewController(HomeViewController(), title: "首页", image: "home", selectedImage: "homeed")
        setChildViewController(VideoViewController(), title: "视频", image: "video", selectedImage: "videoed")
        setChildViewController(MineViewController(), title: "我的", image: "mine", selectedImage: "mineed")
    }

    func setChildViewController(_ child: UIViewController, title: String, image: String, selectedImage: String) {
        child.title = title
        child.tabBarItem.image = UIImage(named: image)
        child.tabBarItem.selectedImage = UIImage(named: selectedImage)
        let nvc = UINavigationController(rootViewController: child)
        addChildViewController(nvc)
    }

    @objc func notiChange(noti: Notification) {

        if let select = noti.userInfo!["post"] {
            selectedIndex = select as! Int
        }
    }


}
