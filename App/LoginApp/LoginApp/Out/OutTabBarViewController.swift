//
//  OutTabBarViewController.swift
//  LoginApp
//
//  Created by Warm-mac on 2018/5/21.
//  Copyright © 2018年 me.warm. All rights reserved.
//

import UIKit

class OutTabBarViewController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}
