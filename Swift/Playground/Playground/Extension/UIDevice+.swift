//
//  UIDevice.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/5.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    var iPhoneX: Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
}
