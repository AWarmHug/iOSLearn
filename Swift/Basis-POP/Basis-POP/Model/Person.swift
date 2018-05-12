//
// Created by Warm-mac on 2018/5/12.
// Copyright (c) 2018 me.warm. All rights reserved.
//

import Foundation

/**
*
* 基本内容
* 属性:就是存储在类或结构体中的内容 比如人的高矮,年龄等
*     访问属性,就直接使用.的方式
*
*
*
*
* 类和结构体的异同
* 同:
*   1.都可以存储值,也就是各种属性
*   2.都可以定义方法
*   3.都可以使用下标,关于来直接访问属性
*   4.都可以使用扩展
*   5.都可以使用协议
* 异:
*   1.类可以使用继承,结构体不可以继承
*   2.
*/

class PersonClass {
    //类的定义使用class关键字
    var name = ""
    var age = 0

    //定义一个方法使用func关键字
    //一般格式:
//    func print(age:Int)-> Int {
//        return 0;
//    }
    //如果没有返回值则不需要-> Int
    //如下,定义了一个eat的方法
    func eat(food: String) {
        print("\(self) 吃了 \(food)")
    }

    func printInfo(){
        print("我叫\(name),今年\(age)了")
    }

}

struct PersonStruct {
    //结构体使用struct关键字
    var name = ""
    var age = 0
    //定义方法和类相同
    func eat(food: String) {
        print("\(self) 吃了 \(food)")
    }

    func printInfo(){
        print("我叫\(name),今年\(age)了")
    }
}