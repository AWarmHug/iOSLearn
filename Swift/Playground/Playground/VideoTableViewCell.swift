//
//  VideoTableViewCell.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/6.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell, RegisterCellFromNib {
    @IBOutlet weak var header: UIImageView!

    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var sign: UILabel!

    @IBOutlet weak var login: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }



    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
