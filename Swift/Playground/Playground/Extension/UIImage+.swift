//
//  UIImage+.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/5.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {

    class func image(fromLayer layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }

    class var back: UIImage {
        return UIImage(named: "nav_back")!
    }
}
