//
//  LoginViewController.swift
//  SnapKitDemo
//
//  Created by Warm-mac on 2018/6/30.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    lazy var web :UILabel={
        let web=UILabel()
        web.text="Hizaima.com"
        web.textColor=UIColor.white
        web.adjustsFontSizeToFitWidth=true
        web.minimumScaleFactor=0.6
        web.font=UIFont.systemFont(ofSize: 24, weight:UIFont.Weight.bold)
        return web
    }()
    
    
    lazy var from :UIView={
        let from=UIView()
        from.backgroundColor=UIColor.white
        from.addSubview(id)
        from.addSubview(pwd)
        return from
    }()
    lazy var id:UITextField={
        let id = UITextField()
        id.keyboardType=UIKeyboardType.phonePad
        id.placeholder="请输入手机号/账号"
        return id
    }()
    lazy var pwd:UITextField={
        let pwd = UITextField()
        pwd.placeholder="请输入密码"
        return pwd
    }()
    
    lazy var loginBt :UIButton={
        let login=UIButton()
        login.setTitle("登录", for: UIControlState.normal)
        login.setTitleColor(UIColor.black, for: UIControlState.normal)
        login.backgroundColor=UIColor.white
        return login
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor(red: 0.3, green: 0.5, blue: 0.7, alpha: 1.0)
        self.view.addSubview(web)
        self.view.addSubview(from)
        self.view.addSubview(loginBt)
        from.snp.makeConstraints { (make) in
            make.width.equalTo(view).multipliedBy(0.9)
            make.height.equalTo(120)
            make.center.equalTo(self.view)
        }
        web.snp.makeConstraints { (make) in
            make.centerX.equalTo(from)
        make.bottom.equalTo(from.snp.top).offset(-10)
            
        }
        id.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.left.top.equalToSuperview()
        }
        
        pwd.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
            make.left.equalToSuperview()
            make.top.equalTo(id.snp.bottom)
        }
        
        loginBt.snp.makeConstraints { (make) in
            make.width.equalTo(from).multipliedBy(0.9)
            make.height.equalTo(48)
            make.centerX.equalTo(from)
            make.top.equalTo(from.snp.bottom).offset(10)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIViewController{
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension UIView{
   
    // 屏幕适配 375 6S尺寸
    func fitScale(AT: CGFloat) -> CGFloat{
        return (UIScreen.main.bounds.width / 375) * AT;
    }
}
