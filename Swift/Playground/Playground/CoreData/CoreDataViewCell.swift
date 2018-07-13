//
//  CoreDataViewCell.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/12.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit

class CoreDataViewCell: UITableViewCell, RegisterCellFromNib {

    var person: Person! {
        didSet {
            lbName.text = person.name
        }
    }

    @IBOutlet weak var lbName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
