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

        //String.Index 字符串的索引，这是一个重点。
        //字符串的修改需要由他来操作
        //str.startIndex 表示在0的位置
        //str.endIndex 表示在最后的位置
//        str.index(after: Index)表示在Index后方，不包含Index
//    str.index(before: Index)表示在Index前放的所有，不包含Index

        str = "abcdefghij"
        print(str.startIndex)
        print(str.endIndex)
        print(str.index(after: str.startIndex))
        print(str.index(before: str.endIndex))


        print(str.substring(from: str.startIndex))
        print(str.substring(from: str.index(after: str.startIndex)))
        print(str.substring(to: str.index(before: str.endIndex)))
        print(str.substring(from: str.index(str.index(of: "e")!, offsetBy: 3)))
        print(str.substring(to: str.index(str.index(of: "e")!, offsetBy: 3)))
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
        str.insert("1", at: str.endIndex)
        print(str)
        str.insert(contentsOf: "234", at: str.index(of: "e")!)
        print(str)

        print(str)

        //8、集合类型 数组 合集 字典
        // Array 数组用来存放有序的可重复的值类型 几乎就类似ArrayList
        // Set 合集用来存放无序的不可重复的值类型
        // Dictionary 字典用来存放无序的键值对

        // Array的操作
        // 空数组
        var arr = [String]()
        // 初始化
        arr = ["张三", "王二", "李四"]
        print(arr)
        //指定位置
        print(arr[1])
        //修改指定位置
        arr[1] = "王贰"
        print(arr)
        //添加
        arr.insert("陆七", at: 3)
        print(arr)
        //移除
        arr.remove(at: 1)
        print(arr)
        //创建指定默认值
        arr = Array(repeating: "name", count: 3)
        print(arr)
        //连接多个数组
        arr += ["赵六", "任八"]
        print(arr)
        //尾部添加
        arr.append("蒋九")
        print(arr)
        //Array都是支持Range的
        arr[0..<3] = ["张三", "王二", "李四"]
        print(arr)
        //遍历数组可以直接使用for in 或者使用 Collection中的方法(后面会具体学习)
//        arr.filter { s in
//                    s != "王二"
//                }
//                .forEach { s in
//                    print(s)
//                }
        //合集的操作
        //Set 可以存放唯一值,和java的hashset类似 也是通过hash值和equals来区分
        //swift中有Hashable协议这个返回hashvalue 并且 Hashable 基础Equatable
        //重写Equatable 中的== 一样需要符合 1/自反性:a==b 2/对称性:a==b b==a 3/传递性: a==b&&b==c 则a==c
        //常用定义方法
        var set2: Set<String> = ["张三", "张三", "王二", "李四"]
        print(set2)
        //添加/删除这些操作也和Array类似
        set2.remove(at: set2.index(of: "张三")!);
        print(set2)
        //定义空
        //初始值
        print("初始值")
        var set = Set<String>()
        set = ["周一", "扬五", "张三", "张三", "王二", "李四"]
        print(set)

        //Set比较重要的是 一个Set和另外一个Set的交集并集关系等操作
        //交集 返回新的set
        print("intersection")
        var intersection = set.intersection(["王二", "李四"])
        print(intersection)
        //除去相交的部分 返回新的set
        print("symmetricDifference")
        var symmetricDifference = set.symmetricDifference(["王二", "李四", "蒋九"])
        print(symmetricDifference)
        //并集 返回新的set
        print("union")
        var union = set.union(["王二", "李四", "蒋九"])
        print(union)
        //a除去和b相同的,留下a中 和b不一样的 返回新的set
        print("subtracting")
        var subtracting = set.subtracting(["王二", "李四", "蒋九"])
        print(set)
        print(subtracting)
        //a 除去 b中 无返回值 直接操作了a
        print("subtract")
        var subtract = set.subtract(["王二", "李四"]);
        print(set)
        print(subtract)
        //一些方法可以在前面加form 意思是a直接赋值,不返回新的set
        var x: Set = [1, 2, 3, 4]
        let y: Set = [3, 4, 5, 6]
        print("formIntersection")
        x.formIntersection(y)
        print(x)
        //Set 关系
        //相等 ==
        //是否为子集
        print("子集")
        print(Set<Int>([1, 2, 3, 4]).isSubset(of: [1, 2, 3, 4, 5]))
        //是否为严格子集, 即 a 包含 b 并且a还包含其他的 并不相等 比如上面就是严格子集 下1不是 下2是
        print(Set<Int>([1, 2, 3, 4]).isStrictSubset(of: [1, 2, 3, 4]))
        print(Set<Int>([1, 2, 3, 4]).isStrictSubset(of: [1, 2, 3, 4, 5]))
        //是否为父集
        print("父集")
        print(Set<Int>([1, 2, 3, 4, 5, 6]).isSuperset(of: [1, 2, 3, 4, 5]))
        //是否为严格父集, 即 a属于b并且b不仅全包含a还包含其他的 并不相等 上面就是严格父集 下1不是 下2是
        print(Set<Int>([1, 2, 3, 4]).isStrictSuperset(of: [1, 2, 3, 4]))
        print(Set<Int>([1, 2, 3, 4, 5]).isStrictSuperset(of: [1, 2, 3, 4]))
        //完全不相等 a和b完全不相等 下1时, 下2不是
        print(Set([1, 2, 3]).isDisjoint(with: Set([4, 5, 6])))
        print(Set([1, 2, 3]).isDisjoint(with: Set([2, 4, 5, 6])))

        //字典相关 类似java的Map <key,value> key是唯一的
        //定义字典
        var dictionary = [1: "One", 2: "two", 3: "Three"]
        print(dictionary)
        dictionary.remove(at: dictionary.startIndex)
        print(dictionary)
        dictionary.updateValue("T", forKey: 3)
        print(dictionary)



    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
