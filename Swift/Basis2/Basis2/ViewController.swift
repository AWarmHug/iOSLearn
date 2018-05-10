//
//  ViewController.swift
//  Basis2
//
//  Created by Warm-mac on 2018/5/10.
//  Copyright © 2018 me.warm. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //循环语句 for in
        for name in ["张三", "王二", "李四", "陆八"] {
            print(name)
        }
        //元组的for in
        for (num, english) in [1: "One", 2: "Two", 3: "Three"] {
            print("\(num)对应\(english)");
        }
        //Range的 for in
        for item in 1...5 {
            print(item)
        }
        //如果不需要知道具体的item 可以使用_ 来代替
        for _ in 1...5 {
            print("打印一下")
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
