//
//  MineCollectionViewCell.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/9.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit

class MineCollectionViewCell: UICollectionViewCell, RegisterCellFromNib {

    var userLogin: UserLogin! {
        didSet {
            label_online.text = userLogin.login ? "未登录" : "在线中"
            label_name.text = userLogin.name
            label_sign.text = userLogin.sign
        }
    }


    @IBOutlet weak var label_online: UILabel!
    @IBOutlet weak var iv_header: UIImageView!
    @IBOutlet weak var label_name: UILabel!
    @IBOutlet weak var label_sign: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return super.preferredLayoutAttributesFitting(layoutAttributes)
    }
}
