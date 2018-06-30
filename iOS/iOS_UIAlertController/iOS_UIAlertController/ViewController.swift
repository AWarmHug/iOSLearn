//
//  ViewController.swift
//  iOS_UIAlertController
//
//  Created by Warm-mac on 2018/5/19.
//  Copyright © 2018 me.warm. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var btAlert: UIButton!

    @IBAction func btAlertTouchUpInside(_ sender: UIButton) {
        let alertController = UIAlertController(title: "温馨提示", message: "您确定要充值?", preferredStyle: .alert);
        alertController.addAction(UIAlertAction(title: "确定", style: .default) { action in
            print("确定")
        })
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel) { action in
            print("取消")
        })
        present(alertController, animated: true)
    }

    @IBAction func btAlertListTouchUpInside(_ sender: UIButton) {
        let alertListController = UIAlertController(title: "分享", message: nil, preferredStyle: .actionSheet)
        let action = { (alertAction: UIAlertAction) in
            print("分享至\(alertAction.title!)")
        }
        alertListController.addAction(UIAlertAction(title: "微博", style: .default, handler: action))
        alertListController.addAction(UIAlertAction(title: "QQ好友", style: .default, handler: action))
        alertListController.addAction(UIAlertAction(title: "朋友圈", style: .default, handler: action))
        alertListController.addAction(UIAlertAction(title: "微信好友", style: .default, handler: action))
        present(alertListController, animated: true)
    }

    @IBAction func btxibTouchUpInside(_ sender: UIButton) {
        let xibAlert=AlertViewController(nibName: "AlertViewController", bundle: nil)
        xibAlert.title="看看"
        present(xibAlert, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
