//
//  SettingViewController.swift
//  LoginApp
//
//  Created by Warm-mac on 2018/6/29.
//  Copyright © 2018年 me.warm. All rights reserved.
//

import UIKit
import SnapKit



class SettingViewController: BaseViewController {

    lazy var box=UIView()
    lazy var boxInBox = UIView()
    lazy var box2 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        box.backgroundColor=UIColor.blue
        boxInBox.backgroundColor=UIColor.cyan
        box2.backgroundColor=UIColor.brown
        self.view.addSubview(box)
        self.box.addSubview(boxInBox)
        self.view.addSubview(box2)
        box.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.top.equalTo(self.view)
        }
        boxInBox.snp.makeConstraints { (make) in
            make.height.width.equalTo(50)
            make.left.centerY.equalTo(box)
        }
        box2.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.top.equalTo(box)
            make.left.equalTo(box.snp.right)
        }
        
        
    }
    
    
    
}
