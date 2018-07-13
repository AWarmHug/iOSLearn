//
//  UIKit+.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/6.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterCellFromNib {

}

extension RegisterCellFromNib {
    static var IDENTIFIER: String! {
        return "\(self)"
    }
    static var NIB: UINib? {
        return UINib(nibName: IDENTIFIER, bundle: nil)
    }
}

extension UITableView {

    func ex_registerCell<T: UITableViewCell>(type: T.Type) where T: RegisterCellFromNib {
        if let nib = T.NIB {
            register(nib, forCellReuseIdentifier: T.IDENTIFIER)
        } else {
            register(type, forCellReuseIdentifier: T.IDENTIFIER)
        }

    }

    func ex_dequeueCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T where T: RegisterCellFromNib {
        return dequeueReusableCell(withIdentifier: T.IDENTIFIER, for: indexPath) as! T
    }
}

extension UICollectionView {
    func ex_registerCell<T: UICollectionViewCell>(type: T.Type) where T: RegisterCellFromNib {
        if let nib = T.NIB {
            register(nib, forCellWithReuseIdentifier: T.IDENTIFIER)
        } else {
            register(type, forCellWithReuseIdentifier: T.IDENTIFIER)
        }
    }

    func ex_dequeueCell<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T where T: RegisterCellFromNib {
        return dequeueReusableCell(withReuseIdentifier: T.IDENTIFIER, for: indexPath) as! T
    }

}
