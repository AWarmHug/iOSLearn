//
//  AnimationViewController.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/10.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit
import SnapKit

class AnimationViewController: BaseViewController {

    lazy var animView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.black
        return view
    }()


    lazy var colorBt: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("变色", for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        bt.addTarget(self, action: #selector(color(sender:)), for: .touchUpInside)
        return bt
    }()

    @objc func color(sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            if self.animView.center.x == 40 {

                self.animView.center.x = 100
            } else {
                self.animView.center.x = 40
            }

            if self.animView.backgroundColor == UIColor.red {
                self.animView.backgroundColor = UIColor.black
            } else {
                self.animView.backgroundColor = UIColor.red
            }
        }
    }

    lazy var moreBt: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("多属性", for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        bt.addTarget(self, action: #selector(more(sender:)), for: .touchUpInside)
        return bt
    }()

    @objc func more(sender: UIButton) {

        UIView.transition(with: self.animView , duration: 0.6 , options: [UIViewAnimationOptions.transitionCurlUp] , animations: {[weak self] in
            if self?.animView.image == #imageLiteral(resourceName: "video") {
                self?.animView.image = #imageLiteral(resourceName: "videoed")
            }else{
                self?.animView.image = #imageLiteral(resourceName: "video")
            }
        }, completion: nil)


//        UIView.animate(withDuration: 1,//动画时间
//                delay: 0,//延迟
//                options: [UIViewAnimationOptions.repeat,UIViewAnimationOptions.autoreverse],//属性
//                animations: {
//                    self.animView.center.x = 100
//                },
//                completion: { (over) -> Void in
//                    print(over)
//                })
    }


    lazy var snapMoveBt: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("SnapKit动画", for: .normal)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        bt.addTarget(self, action: #selector(snapMove(sender:)), for: .touchUpInside)
        return bt
    }()

    @objc func snapMove(sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            if self.animView.backgroundColor == UIColor.red {
                self.animView.backgroundColor = UIColor.black
            } else {
                self.animView.backgroundColor = UIColor.red
            }
            self.animView.snp.updateConstraints { maker in
                maker.width.height.equalTo(self.animView.bounds.width == 80 ? 120 : 80)
            }

            self.view.layoutIfNeeded()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(animView)
        view.addSubview(colorBt)
        view.addSubview(moreBt)
        view.addSubview(snapMoveBt)

        animView.snp.makeConstraints { maker in
            maker.width.height.equalTo(80)
            maker.left.top.equalTo(view)
        }
        colorBt.snp.makeConstraints { maker in
            maker.width.equalTo(80)
            maker.height.equalTo(40)
            maker.left.bottom.equalTo(view)
        }
        moreBt.snp.makeConstraints { maker in
            maker.width.height.equalTo(colorBt)
            maker.left.equalTo(colorBt.snp.right)
            maker.bottom.equalTo(colorBt)
        }

        snapMoveBt.snp.makeConstraints { maker in
            maker.width.height.equalTo(colorBt)
            maker.left.equalTo(moreBt.snp.right)
            maker.bottom.equalTo(colorBt)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
