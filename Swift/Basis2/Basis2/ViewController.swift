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
        //字典的for in
        for (num, english) in [1: "One", 2: "Two", 3: "Three"] {
            print("\(num)对应\(english)");
        }
        //元祖的for in
        for (num, english) in [(1, "One"), (2, "Two"), (3, "Three")] {
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
        //通过stride()函数来达到跨越
        //不包含最后一个
        for item in stride(from: 0, to: 60, by: 5) {
            print(item)
        }
        //包含最后一个
        for item in stride(from: 0, through: 60, by: 5) {
            print(item)
        }

        //while 和java while类似
        var i = 10;
        while i > 0 {
            i -= 1;
            print("i=\(i)")
        }
        print("i<=0")
        //repeat-while 和java do-while类似
        i = 10;
        repeat {
            i -= 1
            print("i=\(i)")
        } while i > 0
        print("i<=0")
        //因为while需要先判断,所以循环体可能一次都不执行
        //repeat-while先执行再判断,所以至少循环一次
        //这和java 类似

        //if else 这和java一模一样,只是可以省略()

        //switch swift中的switch-case不需要设置break
        //可以通过where来设置额外值
        var value = getValue()
        switch value {
        case 1:print("value=\(value)")
        case 2:print("value=\(value)")
        case 3:print("value=\(value)")
        case 4:print("value=\(value)")
        default:print("这是默认值")
        }
        //元祖和for in 一样
        printByTuple((1, "One"))
        printByTuple((2, "Two"))
        printByTuple((3, "Two"))

        //Range和for in 一样
        printByRange(value: 0)
        printByRange(value: 4)
        printByRange(value: 20)
        printByRange(value: 30)
        printByRange(value: 59)
        //switch 可以复合多个值情况
        switch 1 {
        case 1, 2, 3:
            print("<3")
        case 4, 5, 6:
            print(">3 <6")
        default:
            print("我也不知道")
        }
        //重点 控制转移 1/continue 2/break 3/fallthrough 4/return 5/throw
        //1 continue 表示结束当前循环 进入下一次循环
        //2 break 表示终止当前所有循环
        //3 fallthrough表示继续向下执行 类似Java中没有break的情况
        continueDemo()
        breakDemo()
        returnDemo()
        //可以设置标签来标记语句
//        labelDemo(value: 1)
//        labelDemo(value: 3)
//        labelDemo(value: 4)

        if #available(iOS 10, macOS 10.12, *) {
            print("可以调用")
        }else {
            print("不可调用")
        }

    }

    private func labelDemo(value: Int) {
        label: while value != 3 {
            switch value {
            case 3:break label
            case 4:continue label
            default:
                print(value)
            }
        }
    }

    private func printLine() {
        print("---------------------------")
    }

    private func continueDemo() {
        for item in 1...5 {
            if item == 3 {
                continue
            }
            print(item)
        }
        print("hhh")
        print("continue会跳出本次循环,进入下一次循环")
        printLine()
    }

    private func breakDemo() {
        for item in 1...5 {
            if item == 3 {
                break
            }
            print(item)
        }
        print("hhh")
        print("break会直接跳出整个循环,向下继续执行")
        printLine()
    }

    private func returnDemo() {
        for item in 1...5 {
            if item == 3 {
                return
            }
            print(item)
        }
        print("hhh")
        print("return会直接跳出循环,并且结束整个方法")
    }


    private func printByTuple(_ tuple: (Int, String)) {
        switch tuple {
        case let (x, y) where x == 1:
            print("打印1吧")
        case (1, "One"):print(1)
        case (2, "Two"):print(2)
        case (3, "Three"):print(3)
        case (4, "Four"):print(4)
        default:print("我也不知道!")
        }
    }

    private func printByRange(value: Int) {
        switch value {
        case ...0:print("\(value)<0,太小了")
        case 1...10:print("\(value)在1到10之间")
        case 11...20:print("\(value)在11到20之间")
        case 21..<30:print("\(value)在11到30(不包含30)之间")
        case 30...:print("\(value)超过29了,越界了")
        default:print("我也不知道\(value)是什么")
        }
    }


    private func getValue() -> Int {
        return 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
