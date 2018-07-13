//
//  GestureViewController.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/11.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit
import SnapKit

class GestureViewController: BaseViewController {


    lazy var swipeView: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.gray
        label.textColor = UIColor.white
        label.text = "swipe"
        label.textAlignment = NSTextAlignment.center
        label.isUserInteractionEnabled = true
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        label.addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        label.addGestureRecognizer(swipeRight)
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        label.addGestureRecognizer(swipeUp)
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        label.addGestureRecognizer(swipeDown)
        return label
    }()

    @objc func swipe(_ swipeGesture: UISwipeGestureRecognizer) {
        switch swipeGesture.direction {
        case UISwipeGestureRecognizerDirection.left:
            print("向左")
            break
        case UISwipeGestureRecognizerDirection.right:
            print("向右")
            break
        case UISwipeGestureRecognizerDirection.up:
            print("向上")
            break
        case UISwipeGestureRecognizerDirection.down:
            print("向下")
            break
        default:
            break
        }
    }

    lazy var tapView: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.gray
        label.textColor = UIColor.white
        label.text = "tap"
        label.textAlignment = NSTextAlignment.center
        label.isUserInteractionEnabled = true
        let tapOne = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        //设置点击次数,单击:1,双击:2
        tapOne.numberOfTapsRequired = 1
        //设置手指触摸个数,需要1个手指触摸:1,需要两个:2
        tapOne.numberOfTouchesRequired = 2
        label.addGestureRecognizer(tapOne)
        return label
    }()

    lazy var tapTwoView: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.gray
        label.textColor = UIColor.white
        label.text = "tapTwo"
        label.textAlignment = NSTextAlignment.center
        label.isUserInteractionEnabled = true
        let tapOne = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        //设置点击次数,单击:1,双击:2
        tapOne.numberOfTapsRequired = 2
        //设置手指触摸个数,需要1个手指触摸:1,需要两个:2
        tapOne.numberOfTouchesRequired = 1
        label.addGestureRecognizer(tapOne)
        return label
    }()

    @objc func tap(_ tap: UITapGestureRecognizer) {
        print("numberOfTouches:\(tap.numberOfTouches)")
        print("点击次数:\(tap.numberOfTapsRequired)")
        print("触摸手指数:\(tap.numberOfTouchesRequired)")
    }

    lazy var pinchView:UILabel={
        let label = UILabel()
        label.backgroundColor = UIColor.gray
        label.textColor = UIColor.white
        label.text = "pinch"
        label.textAlignment = NSTextAlignment.center
        label.isUserInteractionEnabled = true
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinch(_:)))
        label.addGestureRecognizer(pinch)
        return label
    }()

    @objc func pinch(_ gesture :UIPinchGestureRecognizer){
        print("捏合")
        print("scale=\(gesture.scale)")
        print("velocity=\(gesture.velocity)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let scroll = UIScrollView()
        view.addSubview(scroll)
        scroll.snp.makeConstraints { maker in
            maker.width.equalTo(view)
            maker.top.bottom.equalTo(view)
        }
        scroll.addSubview(swipeView)
        swipeView.snp.makeConstraints { maker in
            maker.width.equalTo(view)
            maker.height.equalTo(view).multipliedBy(0.5)
            maker.top.equalTo(scroll)
        }
        scroll.addSubview(tapView)
        tapView.snp.makeConstraints { maker in
            maker.width.equalTo(view)
            maker.height.equalTo(view).multipliedBy(0.5)
            maker.top.equalTo(swipeView.snp.bottom).offset(1)
        }
        scroll.addSubview(tapTwoView)
        tapTwoView.snp.makeConstraints { maker in
            maker.width.equalTo(view)
            maker.height.equalTo(view).multipliedBy(0.5)
            maker.top.equalTo(tapView.snp.bottom).offset(1)
        }
        scroll.addSubview(pinchView)
        pinchView.snp.makeConstraints { maker in
            maker.width.equalTo(view)
            maker.height.equalTo(view).multipliedBy(0.5)
            maker.top.equalTo(tapTwoView.snp.bottom).offset(1)
            maker.bottom.equalTo(scroll.snp.bottom)
         }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
