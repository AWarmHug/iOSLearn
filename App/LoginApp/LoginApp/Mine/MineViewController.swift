//
//  MineViewController.swift
//  LoginApp
//
//  Created by Warm-mac on 2018/5/21.
//  Copyright © 2018年 me.warm. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController {
    @IBOutlet weak var login: UIView!

    @IBOutlet weak var setting: UIBarButtonItem!
    
    @IBAction func clickSetting(_ sender: Any) {
        let setvc =  UIStoryboard(name: "Setting", bundle: nil).instantiateInitialViewController()
        setvc?.hidesBottomBarWhenPushed = true
        navigationController!.pushViewController(setvc!,animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if !AppDelegate.LOGIN {
            login.addSingleTapGesture(target: self, action: #selector(goLogin(view:)))
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc private func goLogin(view: UIView) {
        performSegue(withIdentifier: "goLogin", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goLogin"{
            segue.destination.hidesBottomBarWhenPushed=true
        }
    }
}


extension UIView {

    func addSingleTapGesture(target: Any?, action: Selector?) {
        isUserInteractionEnabled = true
        let singleTapGesture = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(singleTapGesture)
    }

}
