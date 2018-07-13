//
//  Alert.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/12.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit


protocol Alert {
    func show()
    func dismiss()
}

extension Alert {
    func show() {
    }
}

class EditAlert: UIView {
    var ss:UIColor?

    func hh() {
        ss=nil
    }
}
