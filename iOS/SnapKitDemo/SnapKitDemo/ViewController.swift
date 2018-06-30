//
//  ViewController.swift
//  SnapKitDemo
//
//  Created by Warm-mac on 2018/6/29.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    
     var constraint :Constraint?

    
    lazy var bt:UIButton = {
        let bt=UIButton()
        bt.setTitle("隐藏", for: UIControlState.normal)
        bt.setTitleColor(UIColor.white, for: UIControlState.normal)
        bt.addTarget(self, action: #selector(dismissBox(sender:)), for: UIControlEvents.touchUpInside)
        bt.backgroundColor=UIColor.brown
        return bt
    }()
    
    
    @objc func dismissBox(sender:UIButton?){
        if constraint!.isActive {
            constraint?.deactivate()
        }else{
            constraint?.activate()
        }
    }
    
    lazy var btToLogin:UIButton = {
        let bt=UIButton()
        bt.setTitle("跳转登录", for: UIControlState.normal)
        bt.setTitleColor(UIColor.white, for: UIControlState.normal)
        bt.addTarget(self, action: #selector(toLogin(sender:)), for: UIControlEvents.touchUpInside)
        bt.backgroundColor=UIColor.brown
        return bt
    }()
    
    @objc func toLogin(sender:UIButton?){
        let vc = LoginViewController()
        
        navigationController!.pushViewController(vc,animated: true)
    }
    
    lazy var btToScroll : UIButton={
        let bt=UIButton()
        bt.setTitle("跳转", for: UIControlState.normal)
        bt.setTitleColor(UIColor.white, for: UIControlState.normal)
        bt.backgroundColor=UIColor.brown
        bt.addTarget(self, action: #selector(goScroll(sender:)), for: UIControlEvents.touchUpInside)
        return bt
    }()
    @objc func goScroll(sender:UIButton){
        navigationController!.pushViewController(UIScrollViewController(), animated: true)
    }
    
    
    lazy var box = UIView()
    
    
    lazy var boxIn0 : UILabel = {
        var boxIn0 = UILabel()
        boxIn0.backgroundColor=UIColor.cyan
        boxIn0.text="这是0"
        boxIn0.textColor=UIColor.white
        boxIn0.textAlignment=NSTextAlignment.center
        return boxIn0;
    }()
    
    lazy var boxIn1 : UILabel={
        var boxIn1 = UILabel()
        boxIn1.backgroundColor=UIColor.cyan
        boxIn1.text="这是1"
        boxIn1.textColor=UIColor.white
        boxIn1.textAlignment=NSTextAlignment.center
        return boxIn1;
    }()
    
    lazy var boxIn2 : UILabel={
        var boxIn2 = UILabel()
        boxIn2.backgroundColor=UIColor.cyan
        boxIn2.text="这是2"
        boxIn2.textColor=UIColor.white
        boxIn2.textAlignment=NSTextAlignment.center
        return boxIn2;
    }()
    
    lazy var boxIn3 : UILabel={
        var boxIn3 = UILabel()
        boxIn3.backgroundColor=UIColor.cyan
        boxIn3.text="这是3"
        boxIn3.textColor=UIColor.white
        boxIn3.textAlignment=NSTextAlignment.center
        return boxIn3;
    }()
    
    lazy var boxInbox = UIView()
    lazy var boxLeftBox : UILabel={
        var boxLeftBox = UILabel()
        boxLeftBox.backgroundColor=UIColor.brown
        boxLeftBox.text="这是Left"
        boxLeftBox.textColor=UIColor.white
        boxLeftBox.textAlignment=NSTextAlignment.center
        return boxLeftBox;
    }()
    lazy var boxTopBox:UILabel={
        var boxTopBox = UILabel()
        boxTopBox.backgroundColor=UIColor.brown
        boxTopBox.text="这是Top"
        boxTopBox.textColor=UIColor.white
        boxTopBox.textAlignment=NSTextAlignment.center
        return boxTopBox
    }()
    lazy var boxRightBox:UILabel = {
        var boxRightBox = UILabel()
        boxRightBox.backgroundColor=UIColor.brown
        boxRightBox.text="这是Right"
        boxRightBox.textColor=UIColor.white
        boxRightBox.textAlignment=NSTextAlignment.center
        return boxRightBox
    }()
    lazy var boxUnderBox:UILabel = {
        var boxUnderBox=UILabel()
        boxUnderBox.backgroundColor=UIColor.brown
        boxUnderBox.text="这是Under"
        boxUnderBox.textColor=UIColor.white
        boxUnderBox.textAlignment=NSTextAlignment.center
        return boxUnderBox
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        box.backgroundColor=UIColor.black
        boxInbox.backgroundColor=UIColor.red
    
        
        self.view.addSubview(bt)
        self.view.addSubview(btToLogin)
        self.view.addSubview(btToScroll)

        self.view.addSubview(box)
        self.box.addSubview(boxIn0)
        self.box.addSubview(boxIn1)
        self.box.addSubview(boxIn2)
        self.box.addSubview(boxIn3)
        self.box.addSubview(boxInbox)
        
        self.view.addSubview(boxLeftBox)
        self.view.addSubview(boxTopBox)
        self.view.addSubview(boxRightBox)
        self.view.addSubview(boxUnderBox)
        
        
        bt.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        btToLogin.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    
        btToScroll.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        box.snp.makeConstraints { (make) in
            constraint = make.width.height.equalTo(self.view.snp.width).multipliedBy(0.5).constraint
            make.center.equalTo(view)
        }
        
        boxIn0.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview().multipliedBy(0.4)
            make.left.equalTo(0)
            make.top.equalTo(0)
        }
        boxIn1.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview().multipliedBy(0.4)
            make.right.equalTo(0)
            make.top.equalTo(0)
        }
        boxIn2.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview().multipliedBy(0.4)
            make.left.equalTo(0)
            make.bottom.equalTo(0)
        }
        boxIn3.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview().multipliedBy(0.4)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        
        boxInbox.snp.makeConstraints { (make) in
            make.width.height.equalTo(box).multipliedBy(0.5)
            make.center.equalToSuperview()
        }
        
        boxLeftBox.snp.makeConstraints { (make) in
            make.width.height.equalTo(box)
            make.right.equalTo(box.snp.left)
            make.top.equalTo(box)
        }
        
        boxTopBox.snp.makeConstraints { (make) in
            make.width.height.equalTo(box)
            make.bottom.equalTo(box.snp.top)
            make.left.equalTo(box)
        }
        
        boxRightBox.snp.makeConstraints { (make) in
            make.width.height.equalTo(box)
            make.left.equalTo(box.snp.right)
            make.top.equalTo(box.snp.top)
        }
        
        boxUnderBox.snp.makeConstraints { (make) in
            make.width.height.equalTo(box)
            make.top.equalTo(box.snp.bottom)
            make.left.equalTo(box)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

