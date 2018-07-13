//
//  PlistTableViewCell.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/9.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit

class PlistTableViewCell: UITableViewCell, RegisterCellFromNib {

    @IBOutlet weak var cityInfo: UILabel!

    var city : City! {
        didSet {
            cityInfo.text = "名称:\(city.city),坐标:\(city.lat),\(city.lon)"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
