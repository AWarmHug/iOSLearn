//
//  ViewController.swift
//  Basis-POP
//
//  Created by Warm-mac on 2018/5/10.
//  Copyright © 2018 me.warm. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var personC = PersonClass()
        var personS = PersonStruct(name: "任斌", age: 0, mood: Mood.HAPPY, school: School(name: "常州信息职业技术学院", address: "常州"))
        print("\(personS.name)已经成年了吗?\(personS.adult)")

        personS.age = 14

        personS.age = 15

        personS.age = 19

        personC.residence?.numberOfRooms = 1
        do {
            try personC.goResidence()
        } catch is ResidenceError {
        } catch {
        }


    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
