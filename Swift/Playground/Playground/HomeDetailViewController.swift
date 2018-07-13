//
//  HomeDetailViewController.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/5.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit
import SnapKit

class HomeDetailViewController: BaseViewController {

    var msg: String?

    lazy var msgLabel: UILabel = {
        var msg = UILabel()
        msg.textColor = UIColor.blue
        return msg
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(msgLabel)
        msgLabel.snp.makeConstraints { maker in
            maker.center.equalTo(view)
        }
        if let msg = self.msg {
            msgLabel.text = msg
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
