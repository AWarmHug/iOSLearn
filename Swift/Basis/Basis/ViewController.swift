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
        //5、需要在看看
        //可选项，nil 一个对象可能为空，就用nil来表示，在定义对象的时候可以通过，!和?来表示，如：

        //表示money不可以为nil
        var money: String! = "20";

        //6、可选项绑定 在判断时使用，如果转换成立，则赋值，let和var都支持,
        //判断中支持多个可选项同时绑定，使用'，'分割，其中只要一个发生错误，就为false
        if var myMoney = Int(money) {
            debugPrint("moneyIsNil=\(myMoney),money是数字")
        } else {
            debugPrint("money不是数字")
        }

        //7、区间运算符 闭区间运算符 a...b ，
        //半开区间 运算符 a..<b，
        //单侧区间 a.../...a 从一边的某个位置一直到另外一边尽可能远
        //区间一般用于循环，或者配合数组等数据结构一起使用

        let names = ["张三", "李四", "王二", "陆八"]

        //闭区间，包含a和b，并且a<=b
        debugPrint("区间运算符")
        for item in 1...2 {
            debugPrint(names[item])
        }
        for item in names[1...2] {
            debugPrint(item)
        }
        //半开区间，包含a，不包含b，a<=b
        debugPrint("半开区间")
        for item in 0..<names.count {
            debugPrint(names[item])
        }
        for item in names[0..<names.count] {
            debugPrint(item)
        }
//        这样就会出错
//        for item in 4..<1 {
//            debugPrint(item)
//        }
        //单侧区间 一般配合数组一起使用
        debugPrint("单侧区间")
        for item in names[1...] {
            debugPrint(item)
        }
        for item in names[...2] {
            debugPrint(item)
        }
        //8、String "str"，
        //多行表示 """
        //        str
        //        str
        //        """
        //在字符串中使用引号，需要使用\转义
        var str: String;
        str = "str";
        print(str)
        str = """
        str
        str
        str
        """;
        print(str)
        str = "张三说：\"你好\""
        print(str)

        str = "abcdefghij"
        print(str.startIndex)
        print(str.endIndex)
        //从e到结尾 包含e
        print(str.substring(from: str.index(of: "e")!))
        //从开头到e，不包含e
        print(str.substring(to: str.index(of: "e")!))


        print(str.substring(with: str.index(str.startIndex, offsetBy: 2)..<str.index(str.endIndex, offsetBy: -4)))


        str.filter { (character: Character) -> Bool in
                    (character != "b")
                }
                .compactMap { (character: Character) in
                    print(character)
                }

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
