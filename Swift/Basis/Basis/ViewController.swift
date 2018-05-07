//
//  ViewController.swift
//  Basis
//
//  Created by Warm-mac on 2018/5/7.
//  Copyright © 2018 me.warm. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //1、Swift中使用let声明常量，var声明变量，如：可惜添加类型，也可以自动推倒
        let renbin = "帅"
        let renbin2: String = "帅"
        var poor = true
        var poor2: Bool = true

        //2、Swift可以不添加;如果在同一行需要添加;

        //3、类型别名 typealias 可以给某个类型设置一个别名，在一些语境下回更合适
        typealias Str = String;
        var renbin3: Str = "帅帅帅"//Str和String一样

        //4、元祖：元祖就是用()把一些值组合起来，如：
        var yuanzu: (code: Int, msg: String)

        yuanzu = (code: 200, msg: "请求成功")

        //需要在看看
        //可选项，nil 一个对象可能为空，就用nil来表示，在定义对象的时候可以通过，!和?来表示，如：

        //表示money不可以为nil
        var money: String! = "20";

        if let myMoney = Int(money) {
            debugPrint("moneyIsNil=\(myMoney),money是数字")
        } else {
            debugPrint("money不是数字")
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
